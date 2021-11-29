//
//  Event.swift
//  PupGo_TextField
//
//  Created by wenye on 11/2/21.
//

import SwiftUI
import CoreLocation


class Event: Hashable, ObservableObject, Identifiable {
    
    static func == (lhs: Event, rhs: Event) -> Bool {
        return lhs.userid == rhs.userid
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(userid)
        
    }
    
    
    var userid: String
    var username: String
    var location: String
    var starttime: String
    var endtime: String
    var image: Image?
    var participants: [String] = []
    var humans: [String] = []
    var clocation: CLLocation?
    var type: Int

    
    init(userid: String, username: String, location: String, starttime: String, endtime: String, image: Image, type: Int) {
        self.userid = userid
        self.username = username
        self.location = location
        self.starttime = starttime
        self.endtime = endtime
        self.image = image
        self.type = type
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
    
    

    
    func setParameters(i: Int) {
        print(i)
        Network.shared.apollo.fetch(query: Testing1Query()) { result in
            self.username = try!(result.get().data!.recommendEventsListGet.result[i].holder?.name)! as String
            self.location = try!(result.get().data!.recommendEventsListGet.result[i].location?.address)! as String
            let imageString = try!(result.get().data!.recommendEventsListGet.result[i].image)! as String
            self.starttime = try!(result.get().data!.recommendEventsListGet.result[i].timeRange?.startTime)! as String
            self.endtime = try!(result.get().data!.recommendEventsListGet.result[i].timeRange?.endTime)! as String
            let url = URL(string: imageString)
            let data = try? Data(contentsOf: url!)
            let thisuiimage = UIImage(data: data!)
            self.image = Image(uiImage: thisuiimage!).renderingMode(.original)
        }
    }
    
    
    func addParticipant(newParticipant: String) {
        self.participants.append(newParticipant)
    }

    func addHumans(newHuman: String) {
        self.humans.append(newHuman)
    }
}
