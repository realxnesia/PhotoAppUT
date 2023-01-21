//
//  SignupViewDelegateProtocol.swift
//  PhotoAppUT
//
//  Created by DHIKA ADITYA ARE on 17/11/22.
//

import Foundation

protocol SignupViewDelegateProtocol: AnyObject {
    func successfullSignup()
    func errorHandler(error: SignupErrors)
}
