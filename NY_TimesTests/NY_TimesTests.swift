//
//  NY_TimesTests.swift
//  NY_TimesTests
//
//  Created by Mohammed Essam on 6/14/20.
//  Copyright © 2020 ElhayesGroup. All rights reserved.
//

import XCTest
@testable import NY_Times

class NY_TimesTests: XCTestCase {
    
    func testAPI(){
        let expectation = XCTestExpectation.init(description: "Expect to get response data")

        ApiClient(with: ApiConfig()).request(method: .get,
                                        type: .formEncoded,
                                        endpoint: .mostPopular,
                                        query: ["api-key":"CqM7B7cpRU6GtV2iI8mMD1Y8885RCkQ4"],
                                        authenticated: false) { (response:MostPopularResponse?,error ,code) in
                            guard error == nil else{
                                XCTFail("Fail")
                                return
                            }
                                            
                            guard code == 200 else{
                                XCTFail("Fail")
                                return
                            }
                            
                            guard response != nil else{
                                XCTFail("Fail")
                                return
                            }
                            // The request is finished, so our expectation
                            expectation.fulfill()

                            // We ask the unit test to wait our expectation to finish.
                            self.waitForExpectations(timeout: 10)
                            self.tearDown()
        }
    }
    
    func testbuildQueryString(){
//        let expectation = XCTestExpectation.init(description: "Expect to get ==>>  ?testKey=testValue")

        let params = ["testKey":"testValue","testKey2":"testValue2"]
        
        let query = params.buildQueryString()
        XCTAssertEqual(query, "testKey=testValue&testKey2=testValue2")
        
        let queryEncoded = params.buildQueryString(encoded: true)
        XCTAssertEqual(queryEncoded, "?testKey=testValue&testKey2=testValue2")

        
        self.tearDown()
    }

    
}
