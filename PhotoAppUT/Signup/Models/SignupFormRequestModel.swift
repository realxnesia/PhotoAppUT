//
//  SignupFormRequestModel.swift
//  PhotoAppUT
//
//  Created by DHIKA ADITYA ARE on 09/11/22.
//

import Foundation

struct SignupFormRequestModel: Encodable {
    let firstName: String
    let lastName: String
    let email: String
    let password: String
}
