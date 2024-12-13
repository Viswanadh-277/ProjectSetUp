import Foundation
import UIKit

extension LoginView {
  // MARK: --- UI SetUp ⚙️ ---
  func setUpUI() {
    setUpAction()
  }
  
  // MARK: --- Frames SetUp ⚙️ ---
  
  // MARK: --- Font SetUp ⚙️ ---
  
  // MARK: --- Color SetUp ⚙️ ---
  
  // MARK: --- Localization SetUp ⚙️ ---
  
  // MARK: --- Action SetUp ⚙️ ---
  private func setUpAction() {
    loginBtn.addTarget(self, action: #selector(loginBtnAction), for: .touchUpInside)
    uploadBtn.addTarget(self, action: #selector(uploadBtnAction), for: .touchUpInside)
  }

  // MARK: --- Button Actions 🛑 ---
  @objc private func loginBtnAction() {
    Task { await loginAPI() }
  }
  
  @objc private func uploadBtnAction() {
    let imagePicker = UIImagePickerController()
    imagePicker.delegate = self
    imagePicker.sourceType = .photoLibrary
    present(imagePicker, animated: true, completion: nil)
  }
}

extension LoginView {
  func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
    guard let selectedImage = info[.originalImage] as? UIImage else {
      print("No image selected")
      return
    }
    guard let imageData = selectedImage.jpegData(compressionQuality: 0.8) else {
      return
    }
    picker.dismiss(animated: true, completion: nil)
    Task { await uploadMultipartAPI(pickedImage: imageData) }
  }
  
  func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
    picker.dismiss(animated: true, completion: nil)
  }
}
