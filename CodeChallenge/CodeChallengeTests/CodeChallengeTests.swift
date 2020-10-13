//
//  CodeChallengeTests.swift
//  CodeChallengeTests
//
//  Created by Mounika Jakkampudi on 10/12/20.
//  Copyright © 2020 Tmobile. All rights reserved.
//

import XCTest
@testable import CodeChallenge

class CodeChallengeTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
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
    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
