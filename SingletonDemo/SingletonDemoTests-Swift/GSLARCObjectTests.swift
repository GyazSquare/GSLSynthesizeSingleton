//
//  GSLARCObjectTests.swift
//  SingletonDemo
//

import XCTest

class GSLARCObjectTests: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testShared() {
        let shared: GSLARCObject? = GSLARCObject.shared
        // not nil, just in case
        XCTAssertNotNil(shared)
        // shared
        XCTAssertEqual(GSLARCObject.shared, shared)
        // background
        for _ in 1..<100 {
            let expectation = self.expectation(description: "background")
            DispatchQueue.global(qos: .default).async {
                XCTAssertEqual(GSLARCObject.shared, shared)
                expectation.fulfill()
            }
        }
        self.waitForExpectations(timeout: 1) { errorOrNil in
            if let error = errorOrNil {
                XCTFail("\(error)")
            }
        }
    }

    func testCopy() {
        let shared = GSLARCObject.shared
        let copy = shared.copy() as? GSLARCObject
        XCTAssertEqual(copy, shared)
    }
}
