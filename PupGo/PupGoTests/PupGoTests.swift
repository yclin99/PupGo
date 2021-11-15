//
//  PupGoTests.swift
//  PupGoTests
//  Created by Hsin-Wei Yu on 11/11/21.
import XCTest
@testable import PupGo

class PupGoTests: XCTestCase {
    var sut: EmailLoginView! // System Under Test
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        try super.setUpWithError()
        let login = LoginView()
        sut = EmailLoginView(username: login.$username, password: login.$password)                                               
    }
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        sut = nil
        try super.tearDownWithError()
    }

    func testEmailLoginIsPressed() {
        // given
        sut.username = "Evelynyu"
        sut.password = "GreenField2@4"
        // when
        sut.handleLogin()
        // then
        XCTAssertEqual(sut.log_Status, true, "Login should be successful.")
    }
    
    func testPerformance() throws {
        // This is an example of a performance test case.
        measure (
            // Put the code you want to measure the time of here.
            metrics: [
                XCTClockMetric(),
                XCTCPUMetric(),
                XCTStorageMetric(),
                XCTMemoryMetric()
            ]
        ) {
            sut.handleLogin()
        }
    }
}

