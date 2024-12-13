import Foundation

extension URLRequest {
  public var method: HTTPMethod? {
    get {
      return httpMethod.map { $0.lowercased() }.flatMap(HTTPMethod.init)
    }

    set {
      httpMethod = newValue?.rawValue.uppercased()
    }
  }
}
