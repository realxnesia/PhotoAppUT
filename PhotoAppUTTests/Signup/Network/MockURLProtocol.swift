//
//  MockURLProtocol.swift
//  PhotoAppUTTests
//
//  Created by DHIKA ADITYA ARE on 10/11/22.
//

import Foundation

class MockURLProtocol: URLProtocol {
    
    static var stubResponseData: Data?
    
    //Determines whether the protocol subclass can handle the spesific request.
    override class func canInit(with request: URLRequest) -> Bool {
        return true
    }
    
    override class func canonicalRequest(for request: URLRequest) -> URLRequest {
        return request
    }
    
    //Start protocol pesific loading of the request
    //ketika subclass MockURLProtocol dipanggil, ia akan melakukan loading request. Disini kita mencoba untuk mereturn data secara hardcode/predefined daripada menggunakan yg asli.
    override func startLoading() {
        self.client?.urlProtocol(self, didLoad: MockURLProtocol.stubResponseData ?? Data()) //diload merupakan predefined data yg berbetuk data object
        self.client?.urlProtocolDidFinishLoading(self)
    }
    
    override func stopLoading() { }
}
