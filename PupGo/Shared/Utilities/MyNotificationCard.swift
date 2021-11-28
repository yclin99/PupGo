//
//  MyNotificationCard.swift
//  PupGo
//
//  Created by Hsin-Wei Yu on 11/28/21.
//

import Foundation
import SwiftUI

class NotificationObserver: ObservableObject {
    @Published var notifications = [notification]()
    
    init() {
        Network.shared.apollo.fetch(query: Testing2Query()) { result in
            guard let data = try? result.get().data else {
                print("Error: Fetching Data Error")
                return
            }
            
            
            data.notificationsGet.result.forEach { networkUser in
                let id = networkUser.notificationId
                let type = networkUser.notificationType
                let userID = networkUser.userId
                let time = networkUser.createdAt
                let eventID = networkUser.eventId
                let petID = networkUser.petId
                
                self.notifications.append(notification(id: id, notificationType: type ?? 1, userID: userID ?? "", createTime: time ?? "", eventID: eventID ?? "", petID: petID ?? ""))
                /*
                let id = networkUser.pet?.id
                let name = networkUser.pet?.name
                let breed = networkUser.pet?.breed
                let image = networkUser.pet?.image
                let age = networkUser.pet?.birthday
                let gender = networkUser.pet?.gender?.rawValue
                let isCastration = networkUser.pet?.isCastration
                
                self.notifications.append(<#T##Element#>)*/
            //}
            }
            //self.notifications.removeLast()
            //print("Users-temp", self.users)
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
    var y: CGFloat = 0.0
    var degree: Double = 0.0
}

