//
//  SignupPresenterTest.swift
//  PhotoAppUTTests
//
//  Created by DHIKA ADITYA ARE on 16/11/22.
//

import XCTest
@testable import PhotoAppUT

final class SignupPresenterTest: XCTestCase {
  
  public var sut: SignupPresenter!
  public var signupFormModel: SignupFormModel!
  public var mockSignupModelValidator: MockSignupModelValidator!
  public var mockSignupWebService: MockSignupWebService!
  var mockSignupViewDelegate: MockSignupViewDelegate!
  
  override func setUpWithError() throws {
    //TODO: Arrange
    signupFormModel = SignupFormModel(firstName: "Dhika",
                                      lastName: "Putr",
                                      email: "dhika@dhik.com",
                                      password: "ahaide",
                                      repeatPassword: "ahaide")
    mockSignupModelValidator = MockSignupModelValidator()
    mockSignupWebService = MockSignupWebService()
    mockSignupViewDelegate = MockSignupViewDelegate()
    
    //presenter
    sut = SignupPresenter(formModelValidator: mockSignupModelValidator, webservice: mockSignupWebService, delegate: mockSignupViewDelegate)
  }
  
  override func tearDownWithError() throws {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    signupFormModel = nil
    mockSignupModelValidator  = nil
    mockSignupWebService = nil
    mockSignupViewDelegate = nil
    sut = nil
  }
  
  func testSignupPresenter_WhenInformationProvided_WillValidateEachProperty() {
    //TODO: Act || DI
    sut.processUserSignup(with: signupFormModel)
    
    //TODO: Assert
    XCTAssertTrue(mockSignupModelValidator.isFirstNameValidated, "FirstName was not valid")
    XCTAssertTrue(mockSignupModelValidator.isLastNameValid, "LastName was not valid")
    XCTAssertTrue(mockSignupModelValidator.isValidEmailFormat, "Email was not valid")
    XCTAssertTrue(mockSignupModelValidator.isPasswordValid, "Password was not valid")
    XCTAssertTrue(mockSignupModelValidator.doPasswordMach, "ConfirmPassword was not valid")
  }
  
  func testSignupPresenter_WhenGivenValidForModel_ShouldCallSignupMethod() {
    //TODO: ACT
    sut.processUserSignup(with: signupFormModel)
    
    //TODO: Assert
    XCTAssertTrue(mockSignupWebService.isSignupMethodCalled, "the signup() method was not called in the SignupWebservice Class")
  }
  
  func testSignupPresenter_WhenSignupOperationSuccessful_CallsSuccessOnViewDelegate() {
    //TODO: Arrange
    let myExpectation = expectation(description: "Expected the successfullSignup() method to be called")
    mockSignupViewDelegate.expectation = myExpectation
    
    //TODO: ACT
    sut.processUserSignup(with: signupFormModel)
    self.wait(for: [myExpectation], timeout: 2.0)
    
    //TODO: Assert
    XCTAssertEqual(mockSignupViewDelegate.successfullSignupCounter, 1, "The successfullSignup() method was called more than 1 time")
  }
  
  func testSignuoPresenter_WhenSignupOperationFailed_CallsFailedWithErrorOnViewDelegate() {
    //TODO: Arrange
    let myExpectation = expectation(description: "Expected the errorHandler(error) method to be called")
    mockSignupWebService.shouldReturnError = true
    mockSignupViewDelegate.expectation = myExpectation
//    sut = SignupPresenter(formModelValidator: mockSignupModelValidator, webservice: MockSignupWebServiceFailure(), delegate: mockSignupViewDelegate)
    
    //TODO: ACT
    sut.processUserSignup(with: signupFormModel)
    self.wait(for: [myExpectation], timeout: 2.0)
    
    //TODO: Assert
    XCTAssertEqual(mockSignupViewDelegate.failedSignupCounter, 1, "The errorHandler(error: description) method was not called more than 1 time")
    XCTAssertNotNil(mockSignupViewDelegate.signupError)
  }
  
}
