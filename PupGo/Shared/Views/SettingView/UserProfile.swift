//
//  UserProfile.swift
//  PupGo
//
//  Created by ace_ye on 11/15/21.
//

import Foundation

class UserProfile: Hashable {
    
    static func == (lhs: UserProfile, rhs: UserProfile) -> Bool {
        return lhs.userid == rhs.userid
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(userid)
        
    }
    
    var userid: Int
    var username: String
    var gender: String?
    var birthday: String?
    var location: String?
    var petOwner: Bool
    var mydogs: [DogProfile]?

  
    init(userid: Int, username: String) {
        self.userid = userid
        self.username = username
        self.gender = nil
        self.birthday = nil
        self.location = nil
        self.petOwner = false
  }
    
    func createPet (newdog: DogProfile) {
        self.petOwner = true
        if (mydogs?.append(newdog)) == nil {
            mydogs = [newdog]
        }
    }
    
    func addGender(gender: String) {
        self.gender = gender
    }
    
    func addBirthday(birthday: String) {
        self.birthday = birthday
    }
    
    func addLocation(location: String) {
        self.location = birthday
    }
  
}
