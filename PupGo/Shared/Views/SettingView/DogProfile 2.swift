//
//  DogProfile.swift
//  PupGo
//
//  Created by ace_ye on 11/16/21.
//

import Foundation
import SwiftUI

class DogProfile: Hashable {
    
    static func == (lhs: DogProfile, rhs: DogProfile) -> Bool {
        return lhs.petid == rhs.petid
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(petid)
        
    }
    
    var petid: Int
    var petname: String
    var image: Image
    var gender: String?
    var breed: String?
    var isCastration: Bool
    var birthday: String?
    var location: String?

  
    init(petid: Int, petname: String, image: Image) {
        self.petid = petid
        self.petname = petname
        self.image = image
        self.gender = nil
        self.breed = nil
        self.birthday = nil
        self.location = nil
        self.isCastration = false
  }
    
    func Castrated () {
        self.isCastration = true
    }
    
    func addGender(gender: String) {
        self.gender = gender
    }
    
    func addBirthday(birthday: String) {
        self.birthday = birthday
    }
    
    func addBreded(breed: String) {
        self.breed = breed
    }
    
    func addLocation(location: String) {
        self.location = birthday
    }
  
}
