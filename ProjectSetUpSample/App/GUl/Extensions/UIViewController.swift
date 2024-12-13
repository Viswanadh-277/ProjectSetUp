import Foundation
import UIKit

extension UIViewController {
  var appDelegate: AppDelegate? {
    guard let delegate = UIApplication.shared.delegate as? AppDelegate else {
      return nil
    }
    
    return delegate
  }
  
  var networkManager: NetworkManager {
    return NetworkManager.shared
  }
  
  var registerRepository: RegistrationAPIModule? {
    return networkManager.registrationRepository
  }
}
