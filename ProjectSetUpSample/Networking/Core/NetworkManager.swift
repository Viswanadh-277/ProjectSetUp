import Foundation

final class NetworkManager {
  public static let shared = NetworkManager()
  private init() {}
  
  lazy var networkingHandler: NetworkingHandler = {
    let session = Foundation.URLSession(configuration: URLSessionConfiguration.extendedTimeout)
    let requestFactory: RequestFactory = RequestFactoryImpl()
    return NetworkingHandlerImpl(requestFactory: requestFactory, session: session)
  }()
  
  internal lazy var registrationRepository: RegistrationAPIModule = {
    return RegistrationAPIModuleImpl(networkingHandler: networkingHandler)
  }()
}
