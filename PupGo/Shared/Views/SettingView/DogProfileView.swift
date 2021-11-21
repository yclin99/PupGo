//
//  DogProfileView.swift
//  PupGo
//
//  Created by ace_ye on 11/16/21.
//

import SwiftUI

struct DogProfileView: View {
    var content : DogProfile
    
    @State private var showingAlert = false

    
    var edit: some View {
        NavigationLink(destination: EditDogProfileView(content: content)) {
        Text("Edit").font(.system(size: 20)).bold().foregroundColor(.white)
                .background(RoundedRectangle(cornerRadius: 1).fill(Color.yellow).frame(width: 120, height: 40))
        }
    }
    
    var body: some View {
        ZStack {
            lightYellowColor
                 .edgesIgnoringSafeArea(.all)
            VStack (alignment: .center) {
                content.image.resizable().scaledToFit().frame(width: 250, height: 250)
            List {
                HStack(alignment: .center) {
                    Text("Pet ID: ")
                        .bold()
                    Text(String(content.petid))}
                HStack(alignment: .center) {
                    Text("Pet Name: ")
                        .bold()
                    Text(content.petname)}
                HStack(alignment: .center) {
                    Text("isCastrated: ")
                        .bold()
                    if content.isCastration  {
                        Text("Yes")}
                    else {
                        Text("No")}
                }
                HStack(alignment: .center) {
                    Text("Breed: ")
                        .bold()
                    Text(content.breed ?? "<no_name>")}
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
                .environment(\.defaultMinListRowHeight, 45)
                Spacer(minLength: 30)
                edit
                Spacer(minLength: 80)
            }
        }
    }
}
