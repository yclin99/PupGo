//
//  Card.swift
//  PupGo
//
//  Created by Yuchen Liu on 11/7/21.
//

import Foundation
import SwiftUI

var  JoinRequest: [[String]] = [["2021-11-21T14:02:59+0800","C","upcoming"],["2021-11-01T11:02:33-0800","B","upcoming"],["2021-11-1T04:12:12-0600","A","upcoming"]]
var  UpcomingEvents: [[String]] = [["2021-12-27T21:01:03-0800", "C", "2021-11-21T14:02:59+0800","request2join"], ["2021-12-3T21:01:03-0800", "B", "2021-11-1T04:12:12-0600","request2join"],["2021-11-28T23:55:00-0800", "A", "2021-11-01T11:02:33+0000","request2join"]]

var  FriendsInvite: [[String]] = [["2021-12-4T21:01:03-0800", "C","2021-11-21T14:02:59+0800", "notiback"],["2021-12-02T21:01:03-0800", "B","2021-11-01T11:02:33-0800", "notiback"],["2021-12-01T21:01:03-0800", "A","2021-11-01T04:12:12-0600", "notiback"]]



enum TYPE {
    case joinRequest
    case upcomingEvents
    case friendsInvite
}



struct Card {
    let type: TYPE
    let when: String
    let who:  String
    let launched: String
    let pic : String
    
    static var join: [Card] {
        var join = [Card] ()
        for j in JoinRequest {
            join.append(Card(type: TYPE.joinRequest, when: j[0], who: j[1], launched: j[0], pic: j[2]))
        }
        return join
    }
        
    static var uevent: [Card] {
        var uevent = [Card] ()
        for u in UpcomingEvents {
            uevent.append(Card(type: TYPE.upcomingEvents, when: u[0], who: u[1], launched: u[2], pic: u[3]))
        }
        return uevent
    }
    
    static var fevent: [Card] {
        var fevent = [Card] ()
        for f in FriendsInvite {
            fevent.append(Card(type: TYPE.friendsInvite, when: f[0], who: f[1], launched: f[2], pic: f[3]))
        }
        return fevent
    }
    
}
