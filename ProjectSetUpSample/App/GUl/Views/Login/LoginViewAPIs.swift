import Foundation

extension LoginView {
  // MARK: --- API Call's 🔃 ---
  func loginAPI() async {
    let input = LoginRequest(
      emailOrPhone: "9491921781", password: "Krify@123", type: 2,
      socialId: "", socialType: "", countryCode: 101,
      deviceId: device_Token ?? "", platformType: 2)
    
    guard let repository = registerRepository else { return }
    let result = await repository.login(input: input)
    switch result {
      case .success(let response):
        PrintLogger.modelLog(response, type: .response, isInput: false)
        authToken = response.data.token
      case .failure(let error):
        print(error)
    }
  }
  
  func uploadMultipartAPI(pickedImage: Data) async {
    let coverImageInput = CoverImageRequest(userId: "73a3fbd4-dfd9-46e8-b5a5-171522fab7bd", type: 1)
    let multipartInput = MultipartInput(parameters: coverImageInput, fieldName: "coverImage", fileName: "coverImage", mimeType: "Image/png", fileData: pickedImage)
    guard let repository = registerRepository else { return }
    let result = await repository.profileImage(input: multipartInput)
    switch result {
      case .success(let response):
        PrintLogger.modelLog(response, type: .response, isInput: false)
      case .failure(let error):
        print(error)
    }
  }
}
