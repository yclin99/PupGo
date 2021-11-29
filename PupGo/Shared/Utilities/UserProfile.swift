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

    var userid: String
    var username: String
    @Published var gender: String?
    @Published var birthday: String?
    @Published var location: String?
    @Published var petOwner: Bool
    @Published var mydogs: [DogProfile]?

  
    init() {
        self.userid = ""
        self.username = ""
        self.birthday = ""
        self.mydogs = nil
        self.gender = nil
        self.location = nil
        self.petOwner = false
  }
    
    func setParameters() {
        Network.shared.apollo.fetch(query: UserProfileListGetQuery()) { result in
            guard let data = try? result.get().data else {
                print("Fecthing error")
                return
            }
            self.userid = data.userProfileListGet.result.first?.id ?? ""
            self.username = data.userProfileListGet.result.first?.name ?? ""
            self.birthday = data.userProfileListGet.result.first?.birthday ?? ""
            self.location = data.userProfileListGet.result.first?.location?.address ?? ""
     }}
    
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
