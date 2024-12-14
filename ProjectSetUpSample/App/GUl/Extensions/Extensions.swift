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

// For String
extension Optional where Wrapped == String {
  var orEmpty: String {
    return self ?? ""
  }
}

// For Int
extension Optional where Wrapped == Int {
  var orZero: Int {
    return self ?? 0
  }
}

// For Bool
extension Optional where Wrapped == Bool {
  var orFalse: Bool {
    return self ?? false
  }
}

// For Double
extension Optional where Wrapped == Double {
  var orZero: Double {
    return self ?? 0.0
  }
}

// For Array
extension Optional where Wrapped == [Any] {
  var orEmptyArray: [Any] {
    return self ?? []
  }
}

// For Dictionary
extension Optional where Wrapped == [String: Any] {
  var orEmptyDictionary: [String: Any] {
    return self ?? [:]
  }
}
