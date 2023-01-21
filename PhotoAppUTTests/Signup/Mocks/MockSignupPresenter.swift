//
//  MockSignupPresenter.swift
//  PhotoAppUTTests
//
//  Created by DHIKA ADITYA ARE on 22/11/22.
//

import Foundation
@testable import PhotoAppUT

class MockSignupPresenter: SignupPresenterProtocol {
    var processUserSignupCalled: Bool = false
    
    required init(formModelValidator: PhotoAppUT.SignupModelValidatorProtocol, webservice: PhotoAppUT.SignupWebServiceProtocol, delegate: PhotoAppUT.SignupViewDelegateProtocol) {
        //TODO:
    }
    
    func processUserSignup(with data: PhotoAppUT.SignupFormModel) {
        processUserSignupCalled = true
    }
}
