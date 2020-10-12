//
//  iOSChallengeTests.swift
//  iOSChallengeTests
//
//  Created by Mounika Jakkampudi on 10/10/20.
//  Copyright © 2020 Tmobile. All rights reserved.
//

import XCTest
@testable import iOSChallenge

class iOSChallengeTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        testAsyncAPICall()
    }
    func testAsyncAPICall() {
        let asyncExpectation = expectation(description: "Getting json Dictionary from REST")

        let model = DataViewModel()
        model.fetchChildrensList { (result) in
            switch result {
            case .failure(let error) :
                XCTAssertNil(error)
            case .success(let success) :
                XCTAssertTrue(success)
                XCTAssertEqual(model.childrensList.count, 25)
            }
            asyncExpectation.fulfill()
        }
        
         // after fulfillment
        waitForExpectations(timeout: 10) { (error:Error?) in
            XCTAssertNil(error)
        }
    
    }

}
