import Foundation

var device_Token: String? {
  get {
    return UserDefaults.standard.string(forKey: "DeviceToken")
  }
  set {
    UserDefaults.standard.set(newValue, forKey: "DeviceToken")
    print("Device token updated: \(newValue ?? "nil")")
  }
}

var authToken: String? {
  get {
    return UserDefaults.standard.string(forKey: "AuthToken")
  }
  set {
    UserDefaults.standard.set(newValue, forKey: "AuthToken")
    print("Auth token updated: \(newValue ?? "nil")")
  }
}
