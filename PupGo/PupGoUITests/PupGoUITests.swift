//
//  PupGoUITests.swift
//  PupGoUITests
//
//  Created by Hsin-Wei Yu on 11/11/21.

import XCTest

class PupGoUITests: XCTestCase {
    var app: XCUIApplication!
    override func setUpWithError() throws {
        try super.setUpWithError()
        continueAfterFailure = false
        app = XCUIApplication()
        app.launch()
    }

    func testLoginTabSwitch() {
        let tabBar = XCUIApplication().tabBars["Tab Bar"]
        let exploreTab = tabBar.segmentedControls.buttons["Explore"]
        let settingTab = tabBar.segmentedControls.buttons["Setting"]
        let loginButton = app.buttons["Login"]
        let logoutButton = app.buttons["Logout"]
        
        if loginButton.isSelected {
            XCTAssertTrue(loginButton.exists)
            XCTAssertFalse(exploreTab.exists)
            
            settingTab.tap()
            XCTAssertFalse(loginButton.exists)
            if logoutButton.isSelected {
                XCTAssertTrue(logoutButton.exists)
                XCTAssertFalse(loginButton.exists)
            }
        } 
    }
}
