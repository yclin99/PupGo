//
//  Observer.swift
//  PupGo
//
//  Created by Hsin-Wei Yu on 11/24/21.
//

import Foundation
import SwiftUI


class observer: ObservableObject {
    @Published var users = [datatype]()
    @Published var last = -1
    
    init() {
        //let apolloNetwork = Network.shared.apollo
        //DispatchQueue.main.async {
        
        Network.shared.apollo.fetch(query: Testing1Query()) { result in
            guard let data = try? result.get().data else {
                print("Error: Fetching Data Error")
                return
            }
            
            data.recommendationGet.result.forEach { networkUser in
                
                let id = networkUser.pet?.id
                let name = networkUser.pet?.name
                let breed = networkUser.pet?.breed
                let image = networkUser.pet?.image
                let age = networkUser.pet?.birthday
                let gender = networkUser.pet?.gender?.rawValue
                let isCastration = networkUser.pet?.isCastration
                
                self.users.append(datatype(id: id ?? "", name: name ?? "", image: image ?? "", gender: gender ?? "", breed: breed ?? "", age: age ?? "", isCastration: isCastration ?? true))
            //}
            }
            
            // self.users.removeLast()
            //print("Users-temp", self.users)
        }
    }
    
    func getX(id: String) -> CGFloat {
        for i in 0..<self.users.count {
            // print("Matches::::::")
            if self.users[i].id == id {
                return self.users[i].x
            }
        }
        return 0.0
    }
    
    func getY(id: String) -> CGFloat {
        for i in 0..<self.users.count {
            // print("Matches::::::")
            if self.users[i].id == id {
                return self.users[i].y
            }
        }
        return 0.0
    }
    
    func getD(id: String) -> Double {
        for i in 0..<self.users.count {
            // print("Matches::::::")
            if self.users[i].id == id {
                return self.users[i].degree
            }
        }
        return 0.0
    }
    
    func update(id: String) {
        for i in 0..<self.users.count {
            if self.users[i].id == id {
                self.last = i
            }
        }
    }
    func update(id: String, x: CGFloat, y: CGFloat) {
        for i in 0..<self.users.count {
            if self.users[i].id == id {
                self.users[i].x = x
                self.users[i].y = y
            }
        }
    }
    
    func update(id: String, x: CGFloat, degree: Double) {
        for i in 0..<self.users.count {
            if self.users[i].id == id {
                self.users[i].x = x
                self.users[i].degree = degree
            }
        }
    }
    
    func update(id: String, x: CGFloat, y: CGFloat, degree: Double) {
        for i in 0..<self.users.count {
            // print("Matches::::::")
            if self.users[i].id == id {
                self.users[i].x = x
                self.users[i].y = y
                self.users[i].degree = degree
            }
        }
    }
    
    
    
    
    func goBack(index: Int) {
        self.users[index].x = 0
        self.users[index].y = 0
    }
    
    func updateDB(recommendID: String, result: Bool) {
        if result {
            print("Liked!")
        } else {
            print("Disliked QQQQ!")
        }
        print(recommendID)
        print(result)
        print(myPID)
        Network.shared.apollo.perform(mutation: SetStatusMutation(pid: myPID, recommendID: recommendID, result: result))
    }
    
    func calculateAge() {
        
    }
    
    func getNewUsers() {
        Network.shared.apollo.fetch(query: Testing1Query()) { result in
            guard let data = try? result.get().data else {
                print("Error: Fetching Data Error")
                return
            }
            
            data.recommendationGet.result.forEach { networkUser in
                
                let id = networkUser.pet?.id
                let name = networkUser.pet?.name
                let breed = networkUser.pet?.breed
                let image = networkUser.pet?.image
                let age = networkUser.pet?.birthday
                let gender = networkUser.pet?.gender?.rawValue
                let isCastration = networkUser.pet?.isCastration
                
                self.users.append(datatype(id: id ?? "", name: name ?? "", image: image ?? "", gender: gender ?? "", breed: breed ?? "", age: age ?? "", isCastration: isCastration ?? true))
    
            }
        }
    }
}

struct datatype: Identifiable {
    var id: String
    var name: String
    var image: String
    var gender: String
    var breed: String
    var age: String
    var isCastration: Bool
    var x: CGFloat = 0.0
    var y: CGFloat = 0.0
    var degree: Double = 0.0
}
