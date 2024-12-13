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
    let route = Route<LoginRequest>.parameters(input)
    let task: NetworkTask<ResponseContainer<LoginResponseData>> = await networkingHandler.request(route, endpoint: .login, token: defaultToken, method: .post)
    
    switch await task.networkResult {
      case let .success(response):
        return .success(response)
      case let .failure(error):
        return .failure(error)
    }
  }
  
  public func profileImage(input: MultipartInput<CoverImageRequest>) async -> NetworkResult<ResponseContainer<CoverImageData>> {
    let route = Route<CoverImageRequest>.multipart(input)
    let task: NetworkTask<ResponseContainer<CoverImageData>> = await networkingHandler.request(route, endpoint: .profileImage, token: defaultToken, method: .post)
  
    switch await task.networkResult {
      case let .success(response):
        return .success(response)
      case let .failure(error):
        return .failure(error)
    }
  }
}
