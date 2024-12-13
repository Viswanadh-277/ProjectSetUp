import Foundation

public struct MultipartInput<T> {
  let parameters: T
  let fileKey: String
  let fileName: String
  let mimeType: String
  let fileData: Data
  
  public init(parameters: T, fileKey: String, fileName: String, mimeType: String, fileData: Data) {
    self.parameters = parameters
    self.fileKey = fileKey
    self.fileName = fileName
    self.mimeType = mimeType
    self.fileData = fileData
  }
}
