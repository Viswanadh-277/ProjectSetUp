import Foundation

public extension NetworkTask where Success: Decodable {
  var networkResult: Result<Success, APIError> {
    get async {
      return await result.flatMapError { error in
        if (error as NSError).code == NSURLErrorCancelled {
          return .failure(.cancelled)
        } else {
          return .failure(error as? APIError ?? APIError.unknown())
        }
      }
    }
  }
}
