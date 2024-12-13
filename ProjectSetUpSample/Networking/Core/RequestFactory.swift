import Foundation

public protocol RequestFactory {
  func request<T: Encodable>(for route: Route<T>, token: String, method: HTTPMethod, endPoint: Endpoint) -> URLRequest
}

public class RequestFactoryImpl: RequestFactory {
  public func request<T: Encodable>(for route: Route<T>, token: String, method: HTTPMethod, endPoint: Endpoint) -> URLRequest {
    switch route {
      case let .parameters(input):
        let url = baseUrl.appendingPathComponent(endPoint.rawValue)
        var request = URLRequest(url: url)
        
        request.addValue(API.Field.applicationJson, forHTTPHeaderField: API.Header.contentType)
        request.addValue(token, forHTTPHeaderField: API.Field.authorization)
        request.httpBody = try? JSONEncoder().encode(input)
        request.method = method
        
        return request
        
      case let .multipart(input):
        let url = baseUrl.appendingPathComponent(endPoint.rawValue)
        var request = URLRequest(url: url)
        
        let boundary = "Boundary-\(UUID().uuidString)"
        request.setValue("multipart/form-data; boundary=\(boundary)", forHTTPHeaderField: API.Header.contentType)
        request.addValue(token, forHTTPHeaderField: API.Field.authorization)
        request.httpBody = try? createMultipartBody(with: input, fileKey: input.fileKey, fileName: input.fileName, mimeType: input.mimeType, fileData: input.fileData, boundary: boundary)
        request.method = method
        
        return request
        
      case let .uploadFiles(input):
        var request = URLRequest(url: input.destination)
        request.method = .put
        request.addValue(String(input.localSource.fileSize), forHTTPHeaderField: API.Header.contentLength)
        
        if input.fileType == .thumb {
          request.addValue(API.Field.imageJpeg, forHTTPHeaderField: API.Header.contentType)
        }
        
        return request
    }
  }
  
  private func createMultipartBody<T: Encodable>(with input: MultipartInput<T>, fileKey: String, fileName: String, mimeType: String, fileData: Data, boundary: String) throws -> Data {
    var body = Data()
    
    // Convert the generic parameters into a dictionary
    let encoder = JSONEncoder()
    encoder.keyEncodingStrategy = .convertToSnakeCase // Optional: Change key encoding strategy
    let parametersData = try encoder.encode(input.parameters)
    let parametersDict = try JSONSerialization.jsonObject(with: parametersData, options: []) as? [String: Any] ?? [:]
    
    // Append each parameter
    for (key, value) in parametersDict {
      body.append(Data("--\(boundary)\r\n".utf8))
      body.append(Data("Content-Disposition: form-data; name=\"\(key)\"\r\n\r\n".utf8))
      body.append(Data("\(value)\r\n".utf8))
    }
    
    // Append file data
    body.append(Data("--\(boundary)\r\n".utf8))
    body.append(Data("Content-Disposition: form-data; name=\"\(fileKey)\"; filename=\"\(fileName)\"\r\n".utf8))
    body.append(Data("Content-Type: \(mimeType)\r\n\r\n".utf8))
    body.append(fileData)
    body.append(Data("\r\n".utf8))
    body.append(Data("--\(boundary)--\r\n".utf8))
    
    return body
  }
}

private enum API {
  enum Field {
    static let applicationJson = "application/json"
    static let multiPartFormData = "multipart/form-data; boundary="
    static let imageJpeg = "image/jpeg"
    static let authorization = "Authorization"
  }
  
  enum Header {
    static let contentType = "Content-Type"
    static let contentLength = "Content-Length"
  }
}