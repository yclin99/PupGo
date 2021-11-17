//
//  UserProfile.swift
//  PupGo
//
//  Created by ace_ye on 11/15/21.
//

import SwiftUI

struct UserProfileView: View {
    var content : UserProfile

//    var content = UserProfile(userid: 1, username: "Thisowner")
    
    @State private var showingAlert = false

    
    var edit: some View {
        NavigationLink(destination: EditUserProfileView(content: content)) {
        Text("Edit").font(.system(size: 20)).bold().foregroundColor(.white)
                .background(RoundedRectangle(cornerRadius: 1).fill(Color.yellow).frame(width: 120, height: 40))
        }
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
                    Text("Gender: ")
                        .bold()
                    Text(content.gender ?? "<no_name>")}
                HStack(alignment: .center) {
                    Text("Birthday: ")
                        .bold()
                    Text(content.birthday ?? "<no_name>")}
                HStack(alignment: .center) {
                    Text("Location: ")
                        .bold()
                    Text(content.location ?? "<no_name>")}
                }.listStyle(PlainListStyle())
                .font(.callout)
                .environment(\.defaultMinListRowHeight, 70)
                edit
                Spacer(minLength: 30)
            }
        }
    }
}
