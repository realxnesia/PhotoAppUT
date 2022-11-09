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
    // TODO: Arrange
    let sut = SignupWebService()
    let sigupFormModel =  SignupFormRequestModel(firstName: "Dhika",
                                                 lastName: "Aditya",
                                                 email: "dhika@gmail.com",
                                                password: "1234566")
    let expectation = self.expectation(description: "Signup Web Service Response Expecation")
    //TODO: - ACT
    sut.signup(withForm: sigupFormModel) { (signupResponseModel, error) in
      //TODO: - Assert
      // Backend says format JSON be like -> { \"status\" : \"ok\" }
      XCTAssertEqual(signupResponseModel?.status, "ok")
      expectation.fulfill() //Buat flag disini
    }
    self.wait(for: [expectation], timeout: 5)
    //
  }
  
  //untuk membuat unit test menunggu, kita bisa gunakan self.wait setelah melakukan assert.
  //
  
}
