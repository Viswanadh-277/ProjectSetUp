import Foundation

enum URLType: Int {
  case dev
  case stage
  case local
}

let defaultToken   = "6fc78bad2f4a1a264be5b019d9e2ec3d"
let environment: URLType = .dev

var baseUrl: URL {
  switch environment {
    case .dev:
      return URL(string: "https://dev.yourmoca.com/api")!
    case .stage:
      return URL(string: "https://staging.yourmoca.com/api")!
    case .local:
      return URL(string: "http://10.1.10.80:8000")!
  }
}

public enum Endpoint: String {
  case login = "login"
  case signup = "signup"
  case profileImage = "profileImage"
}
/*
 func getAppDetails() -> (version: String, buildNumber: String, mode: String, apiVersion: String) {
 var version = ""
 var buildNumber = ""
 var mode = ""
 var apiVersion = ""
 
 // Get app version and build number from Info.plist
 if let infoDict = Bundle.main.infoDictionary {
 if let appVersion = infoDict["CFBundleShortVersionString"] as? String {
 version = "V (\(appVersion))"
 }
 if let appBuildNumber = infoDict["CFBundleVersion"] as? String {
 buildNumber = "B (\(appBuildNumber))"
 }
 }
 
 // Get the environment mode (dev or local or prod)
 #if DEBUG
 mode = "Mode: \(environment == .local ? "Local (L)" : "Dev (\(environment == .dev ? "D" : "S"))")"
 apiVersion = "API: V (\(1.5))"
 #else
 mode = "Mode: \(environment == .dev ? "Dev (D)" : "Prod (\(environment == .stage ? "S" : "D"))")"
 apiVersion = "API: V (\(1.5))"
 #endif
 
 return (version, buildNumber, mode, apiVersion)
 }
 */
