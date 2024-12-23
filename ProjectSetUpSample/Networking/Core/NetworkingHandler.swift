import Foundation

public protocol NetworkingHandler {
  func request<T: Encodable, R: Decodable>(_ route: Route<T>, endpoint: Endpoint, token: String, method: HTTPMethod) async -> NetworkTask<R>
}

public class NetworkingHandlerImpl: NetworkingHandler {
  private let requestFactory: RequestFactory
  private let session: URLSession
  
  public init(requestFactory: RequestFactory, session: URLSession) {
    self.requestFactory = requestFactory
    self.session = session
  }
  
  public func request<T: Encodable, R: Decodable>(_ route: Route<T>, endpoint: Endpoint, token: String, method: HTTPMethod) async -> NetworkTask<R> {
    let request = requestFactory.request(for: route, token: token, method: method, endPoint: endpoint)
    
    let task = Task { () -> R in
      switch route {
        case let .uploadFiles(input):
          let result = try await session.upload(for: request, fromFile: input.localSource)
          
          return try await handleResponse(data: result.0, response: result.1, request: request)
        default:
          let result = try await session.data(for: request)
          
          return try await handleResponse(data: result.0, response: result.1, request: request)
      }
    }
    
    return task
  }
  
  private func handleResponse<R: Decodable>(data: Data, response: URLResponse?, request: URLRequest) async throws -> R {
    guard let response = response as? HTTPURLResponse else { throw APIError.unknown() }
    let lastPathComponent = (request.url?.lastPathComponent).orEmpty.uppercased()
    guard response.isSuccess else {
      PrintLogger.log(type: .networking, message: "\(lastPathComponent) request failed ❌")
      throw APIError.internalServerError
    }
    
    do {
      let data: R = try parseResponse(data: data)
      PrintLogger.log(type: .networking, message: "\(lastPathComponent) request succeed ✅")
      return data
    } catch {
      PrintLogger.log(type: .networking, message: "\(lastPathComponent) request could not be parsed ❌")
      throw error
    }
  }
  
  private func parseResponse<R: Decodable>(data: Data) throws -> R {
    let decoder = JSONDecoder()
    decoder.keyDecodingStrategy = .convertFromSnakeCase
    
    do {
      return try decoder.decode(R.self, from: data)
    } catch {
      throw error
    }
  }
}

private func responseBeforeDecode(data: Data) -> String? {
  if let prettyPrintedString = try? JSONSerialization.jsonObject(with: data, options: .fragmentsAllowed),
    let prettyPrintedData = try? JSONSerialization.data(withJSONObject: prettyPrintedString, options: .prettyPrinted),
    let prettyPrintedStringResult = String(data: prettyPrintedData, encoding: .utf8) {
    return prettyPrintedStringResult
  } else {
    return nil
  }
}
