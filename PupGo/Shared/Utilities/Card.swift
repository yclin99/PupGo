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

var  JoinRequest: [[String]] = [["2021-11-21T14:02:59+0800","Tony","https://i.ibb.co/nc2dsPb/IMG-3234.jpg"],["2021-11-01T11:02:33-0800","Bob","https://i.ibb.co/y6HbW1h/IMG-3232.jpg"],["2021-11-1T04:12:12-0600","Alice","https://i.ibb.co/g4q0FgW/IMG-3231.jpg"]]
var  UpcomingEvents: [[String]] = [["2021-12-27T21:01:03-0800", "Tony", "2021-11-21T14:02:59+0800","https://i.ibb.co/nc2dsPb/IMG-3234.jpg"], ["2021-12-3T21:01:03-0800", "Steve", "2021-11-1T04:12:12-0600","https://i.ibb.co/MNwM89M/IMG-3233.jpg"],["2021-12-1T23:55:00-0800", "Bob", "2021-11-01T11:02:33+0000","https://i.ibb.co/y6HbW1h/IMG-3232.jpg"]]

var  FriendsInvite: [[String]] = [["2021-12-02T21:01:03-0800", "Steve","2021-11-01T11:02:33-0800", "https://i.ibb.co/MNwM89M/IMG-3233.jpg"],["2021-12-01T21:01:03-0800", "Jobs","2021-11-01T04:12:12-0600", "https://cdn.pixabay.com/photo/2017/09/25/13/12/cocker-spaniel-2785074_1280.jpg"],["2021-12-4T21:01:03-0800", "UglyDog","2021-11-21T14:02:59+0800", "https://i.ibb.co/M7dzvTJ/IMG-3225.jpg"]]

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
