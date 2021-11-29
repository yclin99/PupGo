//
//  PupGoUITests.swift
//  PupGoUITests
//
//  Created by ace_ye on 11/28/21.
//

import XCTest

class PupGoUITests: XCTestCase {

    var app: XCUIApplication!
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        try super.setUpWithError()
        continueAfterFailure = false
        app = XCUIApplication()
        app.launch()
        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testPageSwitch() throws{
        let app = XCUIApplication()
        app.buttons["Love"].tap()
        app.buttons["Search"].tap()
        app.buttons["Message"].tap()
    }

}
