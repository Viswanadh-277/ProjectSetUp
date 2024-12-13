import Foundation

extension URL {
  var fileSize: UInt64 {
    let attributes = try? FileManager.default.attributesOfItem(atPath: path)
    return attributes?[.size] as? UInt64 ?? UInt64(0)
  }

  func appendingOptionalPathComponent(_ pathComponent: String?) -> URL {
    if let pathComponent = pathComponent {
      return appendingPathComponent(pathComponent)
    } else {
      return self
    }
  }
}
