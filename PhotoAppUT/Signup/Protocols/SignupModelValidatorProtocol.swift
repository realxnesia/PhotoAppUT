//
//  SignupModelValidatorProtocol.swift
//  PhotoAppUT
//
//  Created by DHIKA ADITYA ARE on 16/11/22.
//

import Foundation

protocol SignupModelValidatorProtocol {
    func isFirstNameValid(firstName: String) -> Bool
    func isLastNameValid(lastName: String) -> Bool
    func isValidEmailFormat(email: String) -> Bool
    func isPasswordValid(password: String) -> Bool
    func doPasswordMatch(password: String, repeatPassword: String) -> Bool
}
