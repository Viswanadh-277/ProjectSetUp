import Foundation

extension HTTPURLResponse {
  var isSuccess: Bool {
    return 200...299 ~= statusCode
  }

  var apiError: APIError {
    return APIError.fromCode(statusCode)
  }
}
