import Foundation

var device_Token: String? {
  get {
    return UserDefaults.standard.string(forKey: "DeviceToken")
  }
  set {
    UserDefaults.standard.set(newValue, forKey: "DeviceToken")
    PrintLogger.log(type: .deviceToken, message: newValue.orEmpty)
  }
}

var authToken: String? {
  get {
    return UserDefaults.standard.string(forKey: "AuthToken")
  }
  set {
    UserDefaults.standard.set(newValue, forKey: "AuthToken")
    PrintLogger.log(type: .authToken, message: newValue.orEmpty)
  }
}
