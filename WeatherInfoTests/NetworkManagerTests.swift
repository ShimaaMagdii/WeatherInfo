//
//  NetworkManagerTests.swift
//  WeatherInfoTests
//
//  Created by Shimaa Magdi on 5/12/18.
//  Copyright © 2018 ShimaaMagdi. All rights reserved.
//

import XCTest
import Alamofire

@testable import WeatherInfo

class NetworkManagerTests: XCTestCase {
    let requestTimeOut = TimeInterval(120)
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    
    func testPerformRequestWithPath() {
        unowned let expectations = expectation(description: "Test Perform Request With given Path")
        let url = "search/repositories?q=images"
        
        NetworkManager.performRequestWithPath(path: url, requestMethod: .get, requestParam: nil, headersParam: nil, success:{ (response) in
            
            XCTAssertNotNil(response, "response is nil")
            expectations.fulfill()
            
        }) { (error) in
            expectations.fulfill()
        }
        waitForExpectations(timeout: requestTimeOut, handler: { error in
            if let error = error {
                XCTFail("waitForExpectationsWithTimeout errored: \(error)")
            }
        })
    }
    
    
    func testPerformanceExample() {
        self.measure {
            self.testPerformRequestWithPath()
        }
    }
}
