//
//  SignupFormModelValidator.swift
//  PhotoAppUTTests
//
//  Created by DHIKA ADITYA ARE on 07/11/22.
//

import XCTest
@testable import PhotoAppUT //Pastikan ini di tulis!

final class SignupFormModelValidatorTest: XCTestCase {
    
    //System under test
    var sut: SignupFormModelValidator!
    
    override func setUp() {
        sut = SignupFormModelValidator()
    }
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    //className/method name |
    func testSignupFormModelValidator_WhenValidFIrstNameProvided_ShouldReturnTrue() {
        //TODO: Arrange
//        let sut = SignupFormModelValidator() //create dulu klau ga ada
        
        //TODO: Act
        let isFirstNameValid = sut.isFirstnameValid(firstName: "Dhika") //create methodnya dulu kalau ga ada.
        
        //TODO: Assert
        XCTAssertTrue(isFirstNameValid, "The isFIrstNameValid() should returned TRUE for a valid first name but returned FALSE")
    }
    
    func testSignupFormModelValidator_WhenTooShortFirstNameProvided_ShouldReturnFalse() {
        //TODO: Arrange
//        let sut = SignupFormModelValidator()
        
        //TODO: Act
        let isFirstNameValid = sut.isFirstnameValid(firstName: "S")
        
        //TODO: Assert
        XCTAssertFalse(isFirstNameValid, "The isFirstNameValid() should returned FALSE for a first name that is a shorter than \(SignupConstants.firstNameMaxLength) characters but it has returned TRUE")
    }
    
    func testSignupFormModelValidator_WhenTooLongFirstNameProvided_ShouldReturnFalse() {
        // TODO: ACT
        let isFirstNameValid = sut.isFirstnameValid(firstName: "DhikaAdityaAre")
        //TODO: Assert
        XCTAssertFalse(isFirstNameValid, "The isFirstNameValid() should have return FALSE for a firstname that is longer than \(SignupConstants.firstNameMaxLength) characters but it has returned TRUE")
    }
    
    func testSignupFormModelValidator_WhenEqualPasswordValidated_ShouldReturnTrue() {
        //TODO: ACT
        let doPasswordMatch = sut.doPasswordMatch(password: "12345678", repeatPassword: "12345678")
        //TODO: Assert
        XCTAssertTrue(doPasswordMatch, "The doPasswordMatch() should have return TRUE for matching password but it has returned FALSE")
    }
    
    func testSignupFormModelValidator_WhenNotMatchingProvided_ShouldReturnFalse() {
        //TODO: ACT
        let doPasswordMatch = sut.doPasswordMatch(password: "12345678", repeatPassword: "11111111")
        //TODO: Assert
        XCTAssertFalse(doPasswordMatch, "The doPasswordMatch() should have return FALSE for matching password but it has returned TRUE")
    }
}
