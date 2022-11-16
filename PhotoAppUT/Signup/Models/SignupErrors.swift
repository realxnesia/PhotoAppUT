//
//  SignupErrors.swift
//  PhotoAppUT
//
//  Created by DHIKA ADITYA ARE on 09/11/22.
//

import Foundation

//Localize error merupakan conform dari Error
enum SignupErrors: LocalizedError, Equatable {
    case responseModelParsingError
    case invalidRequestURLString
    case failedRequest(description: String)
    
    var errorDescription: String? {
        switch self {
        case .failedRequest(description: let description):
            return description
        case .responseModelParsingError, .invalidRequestURLString:
            return ""
        }
    }
}
