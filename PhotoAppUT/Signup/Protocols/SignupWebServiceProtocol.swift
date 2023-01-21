//
//  SignupWebServiceProtocol.swift
//  PhotoAppUT
//
//  Created by DHIKA ADITYA ARE on 16/11/22.
//

import Foundation

protocol SignupWebServiceProtocol {
    func signup(withForm formModel: SignupFormRequestModel, completion: @escaping (SignupResponseModel?, SignupErrors?) -> Void)
}
