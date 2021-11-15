//
//  Event.swift
//  PupGo_TextField
//
//  Created by wenye on 11/2/21.
//

import SwiftUI

class Event: Hashable {
    
    static func == (lhs: Event, rhs: Event) -> Bool {
        return lhs.userid == rhs.userid
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(userid)
        
    }
    
    var userid: Int
    var username: String
    var location: String
    var starttime: String
    var endtime: String
    var image: Image
    var participants: [String] = []
    var humans: [String] = []
  
    init(userid: Int, username: String, location: String, starttime: String, endtime: String, image: Image) {
        self.userid = userid
        self.username = username
        self.location = location
        self.starttime = starttime
        self.endtime = endtime
        self.image = image
  }
    
    func addParticipant(newParticipant: String) {
        self.participants.append(newParticipant)
    }
    
    func addHumans(newHuman: String) {
        self.humans.append(newHuman)
    }
  
}
