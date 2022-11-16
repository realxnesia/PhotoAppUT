//
//  SignupWebServiceTest.swift
//  PhotoAppUTTests
//
//  Created by DHIKA ADITYA ARE on 09/11/22.
//

import XCTest
@testable import PhotoAppUT

final class SignupWebServiceTest: XCTestCase {
  
  public var sut: SignupWebService!
  public var signupFormRequestModel: SignupFormRequestModel!
  
  override func setUpWithError() throws {
    // Put setup code here. This method is called before the invocation of each test method in the class.
    let config = URLSessionConfiguration.ephemeral
    config.protocolClasses = [MockURLProtocol.self]
    let customURLSession = URLSession(configuration: config)
    
    sut = SignupWebService(urlString: SignupConstants.urlSignup, urlSession: customURLSession)
    signupFormRequestModel =  SignupFormRequestModel(firstName: "Dhika",
                                                 lastName: "Aditya",
                                                 email: "dhika@gmail.com",
                                                 password: "1234566")
  }
  
  override func tearDownWithError() throws {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    sut = nil
    signupFormRequestModel = nil
    MockURLProtocol.stubResponseData = nil
  }
  
  func testSignupWebService_WhenGivenSuccesfullResponse_ReturnSuccess() {
    // TODO: Arrange
    let jsonString = "{\"status\" : \"ok\"}"
    MockURLProtocol.stubResponseData = jsonString.data(using: .utf8) //convert jsonString ke data object lalu parsing ke stubResponseData
    
    let _ = "http://appsdeveloperblog.com:8080/signup-mock-service/users"
    let url2 = "https://tlyqhtlbn8.execute-api.us-east-1.amazonaws.com/prod/signup-mock-service/users"

    let expectation = self.expectation(description: "Signup Web Service Response Expecation")
    
    //TODO: - ACT
    sut.signup(withForm: signupFormRequestModel) { (signupResponseModel, error) in
      //TODO: - Assert
      XCTAssertEqual(signupResponseModel?.status, "ok")
      expectation.fulfill() //Buat flag disini
    }
    
    self.wait(for: [expectation], timeout: 5)
  }
  
  func testSignupWebService_WhenReceivedDifferentJSONResponse_ErrorTookPlace() {
    //TODO: Arrange
    let jsonString = "{\"path\":\"/users\", \"error\":\"internal server error\"}" //kita membuat json string yg mana json string ini belum dipersiapkan oleh kode kita.
    MockURLProtocol.stubResponseData = jsonString.data(using: .utf8)
    
    let expectation = self.expectation(description: "Signup() method expectation for a response that contains a diffrent JSON strcuture")
    
    //TODO: ACT
    sut.signup(withForm: signupFormRequestModel) { signupResponseModel, error in
      //TODO: Assert
      //expetasinya 'signupResponseModel' bernilai nil karenga jsonString yg di provide tidak kita persiapkan.
      XCTAssertNil(signupResponseModel, "The response model for a request containing unknown JSON Response, should have been nil")
      //ekspetasinya error tidak nil
      XCTAssertEqual(error, SignupErrors.responseModelParsingError, "The signup() method did not return expected error")
      expectation.fulfill()
    }
    self.wait(for: [expectation], timeout: 5.0)
  }
  
  func testSignupWebService_WhenEmptyURLStringProvided_ReturError() {
    //TODO: Arrange
    let expectation = self.expectation(description: "an Empty URL string expectation")
    sut = SignupWebService(urlString: "")
    //TODO: ACT
    sut.signup(withForm: signupFormRequestModel) { signupResponseModel, error in
      //TODO: Assert
      XCTAssertEqual(error, SignupErrors.invalidRequestURLString, "The Signup() method didnot return an expacted error for an invalidRequestURL string error")
      XCTAssertNil(signupResponseModel, "it must be nil")
      expectation.fulfill()
    }
    self.wait(for: [expectation], timeout: 2)
  
  }
  
  func NotestSignupWebService_WhenURLRequestFails_ReturnsErrorMessageDescription() {
    //TODO: Arrange
    let expectation = self.expectation(description: "A Failed request Expectation")
    let errorDescription = "A localized description of an error"
    MockURLProtocol.error = SignupErrors.failedRequest(description: errorDescription)
    
    //TODO: ACT
    sut.signup(withForm: signupFormRequestModel) { signupResponseModel, error in
      //TODO: Assert
      XCTAssertEqual(error, SignupErrors.failedRequest(description: errorDescription))
      expectation.fulfill()
    }
    
    self.wait(for: [expectation], timeout: 2)
  }
  
}
