import Foundation

public protocol RegistrationAPIModule {
  func login(input: LoginRequest) async -> NetworkResult<ResponseContainer<LoginResponseData>>
  func profileImage(input: MultipartInput<CoverImageRequest>) async -> NetworkResult<ResponseContainer<CoverImageData>>
}

public struct RegistrationAPIModuleImpl: RegistrationAPIModule {
  private let networkingHandler: NetworkingHandler
  
  public init(networkingHandler: NetworkingHandler) {
    self.networkingHandler = networkingHandler
  }
  
  public func login(input: LoginRequest) async -> NetworkResult<ResponseContainer<LoginResponseData>> {
    let type = ResponseContainer<LoginResponseData>.self
    let task = await networkingHandler.request(.parameters(input), expecting: type, endpoint: .login, token: defaultToken, method: .post)
    
    switch await task.networkResult {
      case let .success(response):
        return .success(response)
      case let .failure(error):
        return .failure(error)
    }
  }
  
  public func profileImage(input: MultipartInput<CoverImageRequest>) async -> NetworkResult<ResponseContainer<CoverImageData>> {
    let type = ResponseContainer<CoverImageData>.self
    let task = await networkingHandler.request(.multipart(input), expecting: type, endpoint: .profileImage, token: defaultToken, method: .post)
    
    switch await task.networkResult {
      case let .success(response):
        return .success(response)
      case let .failure(error):
        return .failure(error)
    }
  }
}
