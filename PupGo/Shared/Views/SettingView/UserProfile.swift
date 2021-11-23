//
//  UserProfile.swift
//  PupGo
//
//  Created by ace_ye on 11/15/21.
//

import Foundation

class UserProfile: Hashable, ObservableObject {
    
    static func == (lhs: UserProfile, rhs: UserProfile) -> Bool {
        return lhs.userid == rhs.userid
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(userid)
        
    }
    
    var userid: Int
    var username: String
    @Published var gender: String?
    @Published var birthday: String?
    @Published var location: String?
    @Published var petOwner: Bool
    @Published var mydogs: [DogProfile]?

  
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
