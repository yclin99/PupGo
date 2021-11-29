//
//  Card.swift
//  PupGo
//
//  Created by Yuchen Liu on 11/7/21.
//

import Foundation
import SwiftUI

var  JoinRequest: [String] = ["12:30", "Doby", "Nov 11th"]
var  UpcomingEvents: [String] = ["18:30", "Dodley", "Nov 8th"]
var  FriendsOnMove:[String] = ["now", "Dunken", "Nov 10th"]



enum TYPE {
    case joinRequest
    case upcomingEvents
    case friendsOnMove
}



struct Card {
    let type: TYPE
    let when: String
    let who:  String
    let launched: String
    let pic : String
    
    static var join: Card {
        Card(type: TYPE.joinRequest, when:JoinRequest[0], who: JoinRequest[1], launched: JoinRequest[2], pic : "upcoming")
    }

    static var uevent: Card {
        Card(type: TYPE.upcomingEvents, when:UpcomingEvents[0], who: UpcomingEvents[1], launched: UpcomingEvents[2], pic: "request2join")
    }
    
    static var fevent: Card {
        Card(type: TYPE.friendsOnMove, when:FriendsOnMove[0], who: FriendsOnMove[1], launched: FriendsOnMove[2], pic: "notiback")
    }
    
}
