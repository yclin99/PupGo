//
//  Events.swift
//  PupGo (iOS)
//
//  Created by ace_ye on 11/28/21.
//

import SwiftUI
import CoreLocation

class Events: ObservableObject {

    // var count : Int
    @Published var events = [Event]()
    @Published var image = ""
    
    init() {
        Network.shared.apollo.fetch(query:RecommendEventsListGetQuery()) { result in
            guard let data = try? result.get().data else {
                print("Not fetching ")
                return
            }
            data.recommendEventsListGet.result.forEach { eve in
                let id = eve.id
                let username = eve.holder?.name
                let location = eve.location?.address
                let startTime = eve.timeRange?.startTime
                let endTime = eve.timeRange?.endTime
                let imageString = eve.image
                let url = URL(string: imageString!)
                let data = try? Data(contentsOf: url!)
                let thisuiimage = UIImage(data: data!)
                let image = Image(uiImage: thisuiimage!).renderingMode(.original)
                let type = eve.type
                self.events.append(Event(userid: id, username: username ?? "", location: location ?? "", starttime: startTime ?? "", endtime: endTime ?? "", image: image, type: type ?? 0))
            }
        }
    }

}
struct MyEvent: Identifiable {
     var id: String
     var username: String
     var location: String
     var starttime: String
     var endtime: String
     var image: String
}

