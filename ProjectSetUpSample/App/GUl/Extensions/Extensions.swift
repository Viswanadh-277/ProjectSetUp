import Foundation

extension Encodable {
  func encodePrint() -> String? {
    let encoder = JSONEncoder()
    encoder.outputFormatting = .prettyPrinted
    do {
      let jsonData = try encoder.encode(self)
      if let jsonString = String(data: jsonData, encoding: .utf8) {
        return jsonString
      }
    } catch {
      print("Error encoding JSON: \(error)")
    }
    return nil
  }
}
