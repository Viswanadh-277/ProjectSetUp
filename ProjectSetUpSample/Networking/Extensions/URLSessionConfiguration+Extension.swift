import Foundation

extension URLSessionConfiguration {
  public static var extendedTimeout: URLSessionConfiguration {
    let configuration = URLSessionConfiguration.default
    configuration.timeoutIntervalForRequest = 120
    return configuration
  }
}
