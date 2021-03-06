//
//  NotificationObserver.swift
//  PupGo
//
//  Created by Hsin-Wei Yu on 11/28/21.
//

import Foundation
import SwiftUI

class NotificationObserver: ObservableObject {
    @Published var notifications = [notification]()
    @Published var url: String = ""
    @Published var name: String = ""
    init() {
        Network.shared.apollo.fetch(query: Testing1Query()) { result in
            guard let data = try? result.get().data else {
                print("Error: Fetching Data Error")
                return
            }
            
            /*
            data.notificationsGet.result.forEach { networkUser in
                let id = networkUser.notificationId
                let type = networkUser.notificationType
                let userID = networkUser.userId
                let time = networkUser.createdAt
                let eventID = networkUser.eventId
                let petID = networkUser.petId
                
                
                var petList: [String] = []

                petList.append(petID ?? "")
                print(petList)
                
                self.getInfo(pid: petList)
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                    print(self.url)
                
                    self.notifications.append(notification(id: id, notificationType: type ?? 1, userID: userID ?? "", createTime: time ?? "", eventID: eventID ?? "", petID: petID ?? "",petName: self.name, image: self.url))
                }
            }*/
            //self.notifications.removeLast()
            //print("Users-temp", self.users)
        }
    }
    
    func getInfo(pid: [String]) {
        Network.shared.apollo.fetch(query: PetProfilesGetQuery(pid: pid)) { result in
            guard let data = try? result.get().data else {
                print("Error: Fetching Data Error")
                return
            }
            // print(data.petProfileListGet.result.first?.image ?? "")
            self.url = data.petProfileListGet.result.first?.image ?? ""
            self.name = data.petProfileListGet.result.first?.name ?? ""
            //print(self.url)
        }
    }
}

struct notification: Identifiable {
    var id: String
    var notificationType: Int
    var userID: String
    var createTime: String
    var eventID: String
    var petID: String
    var petName: String
    var image: String
    var y: CGFloat = 0.0
    var degree: Double = 0.0
}
