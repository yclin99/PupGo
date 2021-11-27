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
    @Published var image: Image
    @Published var gender: String?
    @Published var breed: String?
    @Published var isCastration: Bool
    @Published var birthday: String?
    @Published var location: String?
    

  
    init(petname: String, image: Image) {
        self.petid = ""
        self.petname = petname
        self.image = image
        self.gender = nil
        self.breed = nil
        self.birthday = nil
        self.location = nil
        self.isCastration = false
  }
    
    func setParametersfirst() {
        Network.shared.apollo.fetch(query: Testing1Query()) { [self] result in
         self.petid = try!(result.get().data!.petProfileListGet.result.first?.id)! as String
         self.petname = try!(result.get().data!.petProfileListGet.result.first?.name)! as String
//         self.gender = try!(result.get().data!.petProfileListGet.result.first?.gender)! as String
         let imageString = try!(result.get().data!.petProfileListGet.result.first?.image)! as String
//            let imageString = "https://cdn.pixabay.com/photo/2017/09/25/13/12/cocker-spaniel-2785074__340.jpg"
         self.breed = try!(result.get().data!.petProfileListGet.result.first?.breed)! as String
         self.birthday = try!(result.get().data!.petProfileListGet.result.first?.birthday)! as String
         let url = URL(string: imageString)
         print(url as Any)
         let data = try? Data(contentsOf: url!)
         print("1234")
         print(data)
         let thisuiimage = UIImage(data: data!)
         print(thisuiimage)
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
