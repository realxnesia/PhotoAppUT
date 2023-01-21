//
//  SignupPresenterProtocol.swift
//  PhotoAppUT
//
//  Created by DHIKA ADITYA ARE on 22/11/22.
//

import Foundation

protocol SignupPresenterProtocol: AnyObject {
    init(formModelValidator: SignupModelValidatorProtocol,
         webservice: SignupWebServiceProtocol,
         delegate: SignupViewDelegateProtocol)
    func processUserSignup(with data: SignupFormModel)
}
