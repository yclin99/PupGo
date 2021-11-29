//
//  PupGoTests.swift
//  PupGoTests
//
//  Created by ace_ye on 11/28/21.
//

import XCTest
import SwiftUI
@testable import EventKit
@testable import PupGo



class PupGoTests: XCTestCase {

    var sut : Event!
    var eventsFamily = Events()
    var newdog : DogProfile!
    var newuser: UserProfile!
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        try super.setUpWithError()
        sut = Event(userid: "", username: "UglyDog", location: "UCLA GreenLand", starttime: "2021.11.8 3:00 pm", endtime: "2021.11.8 5:00 pm", image: Image("Dog1"), type: 0)
        newdog = DogProfile()
        newuser = UserProfile()
        newuser.createPet(newdog: newdog)
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        sut = nil
        newdog = nil
        newuser = nil
        try super.tearDownWithError()
    }
    
    func testEventsclassworkproperly() {
      // given
        let guess = sut.username
      // when

      // then
      XCTAssertEqual(guess, "UglyDog")
    }
    
    func testProfileClassworkproperly() {
      // given
        let test = newuser.username
      // when

      // then
      XCTAssertEqual(test, "")
    }
    
    func testProfileconnectionworkproperly() {
      // given
        let test2 = newuser.mydogs?.count
        XCTAssertEqual(test2, 1)
    }
    
    func testgraphqlFetchworkproperly() {
      // given
        let test3 = eventsFamily.events.first?.username
        XCTAssertEqual(test3, nil)
    }
    
}
