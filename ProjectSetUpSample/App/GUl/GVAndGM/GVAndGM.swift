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
