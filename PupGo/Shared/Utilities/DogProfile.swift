//
//  DogProfile.swift
//  PupGo
//
//  Created by ace_ye on 11/16/21.
//

import Foundation
import SwiftUI

class DogProfile: Hashable, ObservableObject {
    
    static func == (lhs: DogProfile, rhs: DogProfile) -> Bool {
        return lhs.petid == rhs.petid
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(petid)
        
    }
    
    var petid: String
    var petname: String
    @Published var image: Image?
    @Published var imageString: String?
    @Published var gender: String?
    @Published var breed: String?
    @Published var isCastration: Bool
    @Published var birthday: String?
    @Published var location: String?
    

    init() {
        self.petid = ""
        self.petname = ""
        self.gender = nil
        self.breed = nil
        self.birthday = nil
        self.location = nil
        self.isCastration = false
  }
  
    func manuaset (petname: String, image: Image) {
        self.petid = ""
        self.petname = petname
        self.image = image
        self.gender = nil
        self.breed = nil
        self.birthday = nil
        self.location = nil
        self.isCastration = false
  }
    
    
    func setParameters(i: Int) {
        Network.shared.apollo.fetch(query: Testing1Query()) { [self] result in
         self.petid = try!(result.get().data!.petProfileListGet.result[i].id)! as String
         self.petname = try!(result.get().data!.petProfileListGet.result[i].name)! as String
         self.imageString = try!(result.get().data!.petProfileListGet.result[i].image)! as String
         self.breed = try!(result.get().data!.petProfileListGet.result[i].breed)! as String
         self.birthday = try!(result.get().data!.petProfileListGet.result[i].birthday)! as String
         let url = URL(string: imageString!)
         let data = try? Data(contentsOf: url!)
         let thisuiimage = UIImage(data: data!)
         self.image = Image(uiImage: thisuiimage!).renderingMode(.original)
        }
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
