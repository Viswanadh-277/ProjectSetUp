import Foundation

public struct MultipartInput<T> {
  let parameters: T
  let fieldName: String
  let fileName: String
  let mimeType: String
  let fileData: Data
  
  public init(parameters: T, fieldName: String, fileName: String, mimeType: String, fileData: Data) {
    self.parameters = parameters
    self.fieldName = fieldName
    self.fileName = fileName
    self.mimeType = mimeType
    self.fileData = fileData
  }
}
