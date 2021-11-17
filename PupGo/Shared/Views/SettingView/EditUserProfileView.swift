//
//  EditUserProfileView.swift
//  PupGo
//
//  Created by ace_ye on 11/16/21.
//

import SwiftUI

struct EditUserProfileView: View {
    @State var content : UserProfile
//    @State var gender: String
//    @State var birthday: String
//    @State var location: String
//    var content = UserProfile(userid: 1, username: "Thisowner")
    
    @State private var showingAlert = false
    
    var SaveProfile: some View {
        Button(action: {showingAlert = true}, label: {
            Text("Save").font(.system(size: 20)).bold().foregroundColor(.white)
                .background(RoundedRectangle(cornerRadius: 1).fill(Color.yellow).frame(width: 120, height: 40))
        }).alert(isPresented:$showingAlert) {
            Alert(
                title: Text("Changes Saved")
            )}
    }
    
    var body: some View {
        ZStack {
            lightYellowColor
                 .edgesIgnoringSafeArea(.all)
            VStack (alignment: .center) {
            Spacer()
            List {
                HStack(alignment: .center) {
                    Text("User ID: ")
                        .bold()
                    Text(String(content.userid))}
                HStack(alignment: .center) {
                    Text("User Name: ")
                        .bold()
                    Text(content.username)}
                HStack(alignment: .center) {
                    Text("User type: ")
                        .bold()
                    if content.petOwner  {
                        Text("Pet Owner")}
                    else {
                        Text("Human Being")}
                }
                HStack(alignment: .center) {
                    Text("Your Gender is: ")
                        .bold()
                    TextField("Edit Gender...", text: $content.gender.bound)}
                HStack(alignment: .center) {
                    Text("Your Birthday is: ")
                        .bold()
                    TextField("DD/MM/YYYY HH:mm", text: $content.birthday.bound)}
                HStack(alignment: .center) {
                    Text("Your Location is: ")
                        .bold()
                    TextField("No 111 Earth...", text: $content.location.bound)}
                }.listStyle(PlainListStyle())
                .font(.callout)
                .environment(\.defaultMinListRowHeight, 70)
                SaveProfile
                Spacer(minLength: 30)
            }
        }
    }
}

extension Optional where Wrapped == String {
    var _bound: String? {
        get {
            return self
        }
        set {
            self = newValue
        }
    }
    public var bound: String {
        get {
            return _bound ?? ""
        }
        set {
            _bound = newValue.isEmpty ? nil : newValue
        }
    }
}
