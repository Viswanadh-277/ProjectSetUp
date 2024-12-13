/// Wrapper structure used in decoding JSON responses.
public struct ResponseContainer<T: Codable>: Codable {
  public let status: Int?
  public let message: String?
  public let data: T
  
  public init(data: T, status: Int?, message: String?) {
    self.data = data
    self.status = status
    self.message = message
  }
}
