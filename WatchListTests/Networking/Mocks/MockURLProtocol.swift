//
//  MockURLProtocol.swift
//  WatchListTests
//
//  Created by ARMIAMAC on 01/06/25.
//

import Foundation

class MockURLProtocol: URLProtocol {
    static var mockResponse: (data: Data?, response: URLResponse?, error: Error?)?
    
    override class func canInit(with request: URLRequest) -> Bool {
        true
    }

    override class func canonicalRequest(for request: URLRequest) -> URLRequest {
        request
    }

    override func startLoading() {
        if let mock = MockURLProtocol.mockResponse {
            if let error = mock.error {
                self.client?.urlProtocol(self, didFailWithError: error)
            } else {
                if let response = mock.response {
                    self.client?.urlProtocol(self, didReceive: response, cacheStoragePolicy: .notAllowed)
                }
                if let data = mock.data {
                    self.client?.urlProtocol(self, didLoad: data)
                }
                self.client?.urlProtocolDidFinishLoading(self)
            }
        }
    }

    override func stopLoading() {}
}
