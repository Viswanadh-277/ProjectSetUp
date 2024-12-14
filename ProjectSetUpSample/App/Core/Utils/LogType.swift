import Foundation

public enum LogType: String {
  case networking = "🌐 [Networking]"
  case core = "📝 [Info]"
  case apiUrl = "📟 [API URL]"
  case inputParamenters = "📩 Input Parameters"
  case response = "💎 Response"
  case authToken = "🔑 [Auth Token]"
  case deviceToken = "🛡 [Device Token]"
}

public struct PrintLogger {
  public static func log(type: LogType, message: String) {
    #if DEBUG
    print("[YourProjectName] \(type.rawValue) \(message)\n")
    #endif
  }
  
  public static func modelLog<T: Encodable>(_ data: T, type: LogType, isInput: Bool = true) {
    #if DEBUG
    print("[YourProjectName] \(type.rawValue): \n\(data.encodePrint().orEmpty)\n")
    if !isInput {
      print("-------------------------------------------------------------------------------------------------------\n")
    }
    #endif
  }
}
