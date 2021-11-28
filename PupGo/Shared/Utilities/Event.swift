//
//  Event.swift
//  PupGo_TextField
//
//  Created by wenye on 11/2/21.
//

import SwiftUI
import CoreLocation


class Event: Hashable, ObservableObject {
    
    static func == (lhs: Event, rhs: Event) -> Bool {
        return lhs.userid == rhs.userid
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(userid)
        
    }
    
    
<<<<<<< HEAD
    var userid: Int?
=======
    var userid: Int
>>>>>>> origin/Nov-25-21
    var username: String
    var location: String
    var starttime: String
    var endtime: String
    var image: Image
    var participants: [String] = []
    var humans: [String] = []
    var clocation: CLLocation?
  
    init(username: String, location: String, starttime: String, endtime: String, image: Image) {
        self.username = username
        self.location = location
        self.starttime = starttime
        self.endtime = endtime
        self.image = image
        var geocoder = CLGeocoder()
        geocoder.geocodeAddressString(location) {
            placemarks, error in
            let placemark = placemarks?.first
            let lat = placemark?.location?.coordinate.latitude
            let lon = placemark?.location?.coordinate.longitude
            if (lat != nil && lon != nil) {
                self.clocation = CLLocation(latitude: lat!, longitude: lon!)
            }
        }
        
  }
    
    func addParticipant(newParticipant: String) {
        self.participants.append(newParticipant)
    }
    
    func addHumans(newHuman: String) {
        self.humans.append(newHuman)
    }
  
}
