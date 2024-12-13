import UIKit

class LoginView: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
  // MARK: --- Outlets ➡️ ---
  @IBOutlet weak var loginBtn: UIButton!
  @IBOutlet weak var uploadBtn: UIButton!
  
  // MARK: --- Variables 💾 ---
  
  // MARK: --- Life Cycle Methods ♻️ ---
  override func viewDidLoad() {
    super.viewDidLoad()
    setUpUI()
  }
  
  // MARK: --- Table View Delegate Methods 📚 ---
  
  // MARK: --- Collection View Delegate Methods 🎲 ---
}
