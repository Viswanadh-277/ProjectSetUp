import Foundation

/// Enum representing all types of API errors returned from requests supported by the application.
public enum APIError: Error {
  /// Error signaling undefined state of the request/response.
  case unknown(Int? = nil)
  
  /// Request cancelled.
  case cancelled
  
  /// No internet connection.
  case noInternetConnection
  
  /// User has sent too many requests in a given amount of time.
  case tooManyRequests
  
  /// Server cannot or will not process the request due to an apparent client error.
  case badRequest
  
  /// Similar to 403 Forbidden, but specifically for use when authentication is required and has failed or has not yet been provided.
  case unauthorized
  
  /// Requested resource could not be found but may be available in the future.
  case notFound
  
  /// Server timed out waiting for the request.
  case requestTimeout
  
  /// Generic error message, given when an unexpected condition was encountered and no more specific message is suitable
  case internalServerError
  
  /// Server is currently unavailable (e.g. overloaded or down for maintenance).
  case serviceUnavailable
  
  /// Server was acting as a gateway or proxy and received an invalid response from the upstream server.
  case badGateway
}

/// Allows to create `APIError` instance from a given status code.
extension APIError {
  // swiftlint:disable:next cyclomatic_complexity
  static func fromCode(_ statusCode: Int) -> APIError {
    switch statusCode {
      case 400: return .badRequest
      case 401: return .unauthorized
      case 404: return .notFound
      case 408: return .requestTimeout
      case 429: return .tooManyRequests
      case 500: return .internalServerError
      case 502: return .badGateway
      case 503: return .serviceUnavailable
      case 25: return .cancelled
      case 15: return .noInternetConnection
      default: return .unknown(statusCode)
    }
  }
}
