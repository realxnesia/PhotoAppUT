//
//  SignupViewControllerTest.swift
//  PhotoAppUTTests
//
//  Created by DHIKA ADITYA ARE on 22/11/22.
//

import XCTest
@testable import PhotoAppUT

final class SignupViewControllerTest: XCTestCase {

    var storyboard: UIStoryboard!
    var sut: SignupViewController!
    
    override func setUpWithError() throws {
        storyboard = UIStoryboard(name: "Main", bundle: nil)
        sut = storyboard.instantiateViewController(withIdentifier: "SignupViewController") as? SignupViewController
        sut.loadViewIfNeeded()
    }

    override func tearDownWithError() throws {
        storyboard = nil
        sut = nil
    }
    
    func testSignupViewController_WhenCreated_HasRequiredTextFieldEmpty() throws {
        let errorOutlet = "Text field is not connected to an IBOutlet"
        let firstNameTextField = try XCTUnwrap(sut.firstNameTextField, "\(errorOutlet) The FirstName")
        let lastNameTextField = try XCTUnwrap(sut.lastNameTextField, "\(errorOutlet) The LastName")
        let emailTextField = try XCTUnwrap(sut.emailTextField, "\(errorOutlet) The Email")
        let passwordTextField = try XCTUnwrap(sut.passwordTextField, "\(errorOutlet) The Password")
        let repeatPasswordTextField = try XCTUnwrap(sut.repeatPasswordTextField, "\(errorOutlet) The Repeat Password")
                                            
        let errorMessage = "text field was not empty when the view controller initially loaded"
        XCTAssertEqual(firstNameTextField.text, "", "FirstName \(errorMessage)")
        XCTAssertEqual(lastNameTextField.text, "", "LastName \(errorMessage)")
        XCTAssertEqual(emailTextField.text, "", "Email \(errorMessage)")
        XCTAssertEqual(passwordTextField.text, "", "Password \(errorMessage)")
        XCTAssertEqual(repeatPasswordTextField.text, "", "RepeatPassword \(errorMessage)")
    }

    func testSignupViewController_WhenCreated_HasSignupButtonAndAction() throws {
        let errorOutlet = "is not connected to an IBOutlet"
        
        let signupButton: UIButton = try XCTUnwrap(sut.signupButton, "Signup Button \(errorOutlet)")
        let signupButtonActions = try XCTUnwrap(signupButton.actions(forTarget: sut, forControlEvent: .touchUpInside), "Signup Button does not have a refrencing outlet") //forTarget-nya itu controller kita. Jadi sut.
        
        XCTAssertEqual(signupButtonActions.count, 1)
        XCTAssertEqual(signupButtonActions.first, "signupButtonTapped:", "There is no action with a name signupButtonTapped assignedto signup Button")
    }
    
    func testSignupViewController_WhenSignupButtonTapped_InvokesSignupProcess() {
        //Arrange
        let mockValidator = MockSignupModelValidator()
        let mockWebService = MockSignupWebService()
        let mockDelegate = MockSignupViewDelegate()
        
        let mockSignupPresenter = MockSignupPresenter(formModelValidator: mockValidator, webservice: mockWebService, delegate: mockDelegate)
        sut.signupPresenter = mockSignupPresenter
        
        //ACT
        sut.signupButton.sendActions(for: .touchUpInside)
        
        //Assert
        XCTAssertTrue(mockSignupPresenter.processUserSignupCalled, "The process userSignup() method was not called in a presenter object when the signup button was tapped in a SignupViewController")//test fungsionality pada view controller, yg mana presenter object membutuhkan mock object
        
    }
}
