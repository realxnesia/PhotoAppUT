//
//  SignupWebServiceTest.swift
//  PhotoAppUTTests
//
//  Created by DHIKA ADITYA ARE on 09/11/22.
//

import XCTest
@testable import PhotoAppUT

final class SignupWebServiceTest: XCTestCase {
  
  override class func setUp() {
    
  }
  
  override class func tearDown() {
    
  }
  
  override func setUpWithError() throws {
    // Put setup code here. This method is called before the invocation of each test method in the class.
  }
  
  override func tearDownWithError() throws {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
  }
  
  func testSignupWebService_WhenGivenSuccesfullResponse_ReturnSuccess() {
    // Arrange
    let sut = SignupWebService()
    let sigupFormModel =  SignupFormRequestModel(firstName: "Dhika",
                                                 lastName: "Aditya",
                                                 email: "dhika@gmail.com",
                                                 password: "1234566")
    sut.signup(withForm: sigupFormModel) { (signupResponseModel, error) in
      
    }
  }
  
}
