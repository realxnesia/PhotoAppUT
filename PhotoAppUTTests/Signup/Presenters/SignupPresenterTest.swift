//
//  SignupPresenterTest.swift
//  PhotoAppUTTests
//
//  Created by DHIKA ADITYA ARE on 16/11/22.
//

import XCTest
@testable import PhotoAppUT

final class SignupPresenterTest: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testSignupPresenter_WhenInformationProvided_WillValidateEachProperty() {
        //TODO: Arrange
        let signupFormModel = SignupFormModel(firstName: "Dhika",
                                              lastName: "Putr",
                                              email: "dhika@dhik.com",
                                              password: "ahaide",
                                              repeatPassword: "ahaide")
        let mockSignupModelValidator = MockSignupModelValidator()
        
        //presenter
        let sut = SignupPresenter(formModelValidator: mockSignupModelValidator)
        
        //TODO: Act || DI
        sut.processUserSignup(with: signupFormModel)
        
        //TODO: Assert
        XCTAssertTrue(mockSignupModelValidator.isFirstNameValidated, "FirstName was not valid")
        XCTAssertTrue(mockSignupModelValidator.isLastNameValid, "LastName was not valid")
        XCTAssertTrue(mockSignupModelValidator.isValidEmailFormat, "Email was not valid")
        XCTAssertTrue(mockSignupModelValidator.isPasswordValid, "Password was not valid")
        XCTAssertTrue(mockSignupModelValidator.doPasswordMach, "ConfirmPassword was not valid")
    }

}
