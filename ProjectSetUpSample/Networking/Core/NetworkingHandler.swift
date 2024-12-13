import Foundation

public protocol NetworkingHandler {
  func request<T: Codable, R: Decodable>(_ route: Route<T>, expecting type: R.Type, endpoint: Endpoint, token: String, method: HTTPMethod) async -> NetworkTask<R>
}

public class NetworkingHandlerImpl: NetworkingHandler {
  private let requestFactory: RequestFactory
  private let session: URLSession
  
  public init(requestFactory: RequestFactory, session: URLSession) {
    self.requestFactory = requestFactory
    self.session = session
  }
  
  public func request<T: Codable, R: Decodable>(_ route: Route<T>, expecting type: R.Type, endpoint: Endpoint, token: String, method: HTTPMethod) async -> NetworkTask<R> {
    let request = requestFactory.request(for: route, token: token, method: method, endPoint: endpoint)
    
    let task = Task { () -> R in
      switch route {
        case let .uploadFiles(input):
          let result = try await session.upload(for: request, fromFile: input.localSource)
          
          return try await handleResponse(data: result.0, response: result.1, expecting: type)
        default:
          let result = try await session.data(for: request)
          
          return try await handleResponse(data: result.0, response: result.1, expecting: type)
      }
    }
    
    return task
  }
  
  private func handleResponse<R: Decodable>(data: Data, response: URLResponse?, expecting type: R.Type) async throws -> R {
    guard let response = response as? HTTPURLResponse else { throw APIError.unknown() }
    
    guard response.isSuccess else {
      throw APIError.internalServerError
    }
    
    do {
      let data = try parseResponse(data: data, expecting: type)
      return data
    } catch {
      throw error
    }
  }
  
  private func parseResponse<R: Decodable>(data: Data, expecting type: R.Type) throws -> R {
    let decoder = JSONDecoder()
    decoder.keyDecodingStrategy = .convertFromSnakeCase
    
    do {
      return try decoder.decode(type, from: data)
    } catch {
      throw error
    }
  }
}
