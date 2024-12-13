import XCTest
@testable import ProjectSetUpSample

final class ProjectSetUpSampleTests: XCTestCase {
   var requestFactory: RequestFactoryImpl!
   
   override func setUp() {
      super.setUp()
      requestFactory = RequestFactoryImpl()
   }
   
   // Test for `.parameters` case
   func testRequestWithParameters() {
      let expectedInput = LoginRequest(
         emailOrPhone: "9491921781", password: "Krify@123", type: 2,
         socialId: "", socialType: "", countryCode: 101,
         deviceId: device_Token ?? "", platformType: 2)
      
      let input: RequestBody<LoginRequest?> = .parameters(expectedInput)
      let token = "some_token"
      let method: HTTPMethod = .post
      let endPoint: Endpoint = .login
            
      // Create the request
      let request = requestFactory.request(for: input, token: token, method: method, endPoint: endPoint)
      
      // Assert the URL
      XCTAssertEqual(request.url?.absoluteString, "https://dev.yourmoca.com/api/login")
      
      // Assert the HTTP method
      XCTAssertEqual(request.httpMethod, "POST")
      
      // Assert the content type header
      XCTAssertEqual(request.value(forHTTPHeaderField: "Content-Type"), "application/json")
      
      // Assert the authorization token header
      XCTAssertEqual(request.value(forHTTPHeaderField: "Authorization"), token)
   }
}
