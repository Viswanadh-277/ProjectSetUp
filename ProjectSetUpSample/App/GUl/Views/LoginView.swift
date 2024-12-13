import UIKit

class LoginView: UIViewController {
  // MARK: --- Outlets ➡️ ---
  @IBOutlet weak var loginBtn: UIButton!
  @IBOutlet weak var uploadBtn: UIButton!
  
  // MARK: --- Variables 💾 ---
  
  // MARK: --- Life Cycle Methods ♻️ ---
  override func viewDidLoad() {
    super.viewDidLoad()
    setUpUI()
  }
  
  // MARK: --- UI SetUp ⚙️ ---
  private func setUpUI() {
    setUpAction()
  }
  
  // MARK: --- Frames SetUp ⚙️ ---
  
  // MARK: --- Font SetUp ⚙️ ---
  
  // MARK: --- Color SetUp ⚙️ ---
  
  // MARK: --- Localization SetUp ⚙️ ---
  
  // MARK: --- Action SetUp ⚙️ ---
  private func setUpAction() {
    loginBtn.addTarget(self, action: #selector(loginBtnAction), for: .touchUpInside)
    uploadBtn.addTarget(self, action: #selector(loginBtnAction), for: .touchUpInside)
  }
  
  // MARK: --- Button Actions 🛑 ---
  @objc private func loginBtnAction() {
    Task { await loginAPI() }
  }
  
  // MARK: --- API Call's
  private func loginAPI() async {
    let input = LoginRequest(
      emailOrPhone: "9491921781", password: "Krify@123", type: 2,
      socialId: "", socialType: "", countryCode: 101,
      deviceId: device_Token ?? "", platformType: 2)
    
    guard let repository = registerRepository else { return }
    let result = await repository.login(input: input)
    switch result {
      case .success(let response):
        print(response.encodePrint() ?? "")
      case .failure(let error):
        print(error)
    }
  }
  
  // MARK: --- Table View Delegate Methods 📚 ---
  
  // MARK: --- Collection View Delegate Methods 🎲 ---
}
