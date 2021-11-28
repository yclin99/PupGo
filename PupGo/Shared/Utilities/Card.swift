//
//  Card.swift
//  PupGo
//
//  Created by Yuchen Liu on 11/7/21.
//

/*
query Notify{
    notificationsGet(notificationsGetInput: {uid: "982a33ee-2792-4ede-b307-f38d187a2015"}){
        result{
            notification_type
            created_at
            eventId
            petId
        }
        timestamp
    }
}
*/

import Foundation
import SwiftUI

var  JoinRequest: [[String]] = [["2021-11-21T14:02:59+0800","C","https://i.ibb.co/nc2dsPb/IMG-3234.jpg"],["2021-11-01T11:02:33-0800","B","https://i.ibb.co/nc2dsPb/IMG-3234.jpg"],["2021-11-1T04:12:12-0600","A","https://i.ibb.co/nc2dsPb/IMG-3234.jpg"]]
var  UpcomingEvents: [[String]] = [["2021-12-27T21:01:03-0800", "C", "2021-11-21T14:02:59+0800","https://i.ibb.co/nc2dsPb/IMG-3234.jpg"], ["2021-12-3T21:01:03-0800", "B", "2021-11-1T04:12:12-0600","https://i.ibb.co/nc2dsPb/IMG-3234.jpg"],["2021-11-28T23:55:00-0800", "A", "2021-11-01T11:02:33+0000","https://i.ibb.co/nc2dsPb/IMG-3234.jpg"]]

var  FriendsInvite: [[String]] = [["2021-12-4T21:01:03-0800", "C","2021-11-21T14:02:59+0800", "https://i.ibb.co/nc2dsPb/IMG-3234.jpg"],["2021-12-02T21:01:03-0800", "B","2021-11-01T11:02:33-0800", "https://i.ibb.co/nc2dsPb/IMG-3234.jpg"],["2021-12-01T21:01:03-0800", "A","2021-11-01T04:12:12-0600", "https://i.ibb.co/nc2dsPb/IMG-3234.jpg"]]

enum TYPE {
    case newFriend
    case joinRequest
    case upcomingEvents
    case friendsInvite
}



struct Card {
    let type: TYPE
    let when: String
    let who:  String
    let launched: String
    let pic : Image
    
    static var join: [Card] {
        var join = [Card] ()
        for j in JoinRequest {
            let url = URL(string: j[2])
            let data = try? Data(contentsOf: url!)
            let thisuiimage = UIImage(data: data!)
            let dog_picture = Image(uiImage: thisuiimage!).renderingMode(.original)
            join.append(Card(type: TYPE.joinRequest, when: j[0], who: j[1], launched: j[0], pic: dog_picture))
        }
        return join
    }
        
    static var uevent: [Card] {
        var uevent = [Card] ()
        for u in UpcomingEvents {
            let url = URL(string: u[3])
            let data = try? Data(contentsOf: url!)
            let thisuiimage = UIImage(data: data!)
            let dog_picture = Image(uiImage: thisuiimage!).renderingMode(.original)
            
            uevent.append(Card(type: TYPE.upcomingEvents, when: u[0], who: u[1], launched: u[2], pic: dog_picture))
        }
        return uevent
    }
    
    static var fevent: [Card] {
        var fevent = [Card] ()
        for f in FriendsInvite {
            let url = URL(string: f[3])
            let data = try? Data(contentsOf: url!)
            let thisuiimage = UIImage(data: data!)
            let dog_picture = Image(uiImage: thisuiimage!).renderingMode(.original)
            fevent.append(Card(type: TYPE.friendsInvite, when: f[0], who: f[1], launched: f[2], pic: dog_picture))
        }
        return fevent
    }
    
    
    
}
