//
//  SingleEventView.swift
//  PupGo_TextField
//
//  Created by ace_ye on 11/7/21.
//

import SwiftUI

struct SingleEventView: View {
    var content : Event
    
    var photoview: some View {
        ZStack{
        Color(#colorLiteral(red: 1, green: 1, blue: 0.88, alpha: 255)).edgesIgnoringSafeArea(.all)
        ZStack {
            Rectangle()
                .fill(Color.secondary)
            .frame(width: 200, height: 200)
            content.image!.resizable().scaledToFit()
            }
        }
    }

    
    @State private var showingAlert = false

    
    var join: some View {
        Button(action: {
            showingAlert = true
            let newJoinInput = EventsJoinInput(pid: "5d76c3ad-d286-4c82-9ff0-6e043389f00d", eventId: content.userid, description: nil)
            Network.shared.apollo.perform(mutation: EventJoinMutation(input: newJoinInput))
        }, label: {
            Text("Join").font(.system(size: 20)).bold().foregroundColor(.white)
                .background(RoundedRectangle(cornerRadius: 1).fill(Color.yellow).frame(width: 160, height: 50))
        }).alert(isPresented:$showingAlert) {
            Alert(
                title: Text("Join Request Sent")
            )}
    }
    
    var body: some View {
        ZStack {
            Color(#colorLiteral(red: 1, green: 1, blue: 0.88, alpha: 255)).edgesIgnoringSafeArea(.all)
        VStack(alignment: .leading) {
        photoview
        VStack(alignment: .leading){
        HStack(alignment: .center) {
            Image(systemName: "pawprint.circle").font(.largeTitle).foregroundColor(.black)
            Text("Username:")
                .font(.callout)
                .bold().foregroundColor(.black)
            Text(content.username).font(.callout).foregroundColor(.black).bold()}
        }.padding()
        HStack(alignment: .center) {
            Image(systemName: "clock").font(.largeTitle).foregroundColor(.black)
            Text("Start Time:")
                .font(.callout)
                .bold().foregroundColor(.black)
            Text(content.starttime).font(.callout).foregroundColor(.black).bold()}
        .padding()
        HStack(alignment: .center) {
            Image(systemName: "clock.fill").font(.largeTitle).foregroundColor(.black)
            Text("End Time:  ")
                .font(.callout)
                .bold().foregroundColor(.black)
            Text(content.endtime).font(.callout).foregroundColor(.black).bold()}
        .padding()
        HStack(alignment: .center) {
            Image(systemName: "location").font(.largeTitle).foregroundColor(.black)
            Text("Location:   ")
                .font(.callout)
                .bold().foregroundColor(.black)
            Text(content.location).font(.callout).foregroundColor(.black).bold()}
        .padding()
        HStack(alignment: .center) {
            Image(systemName: "location").font(.largeTitle).foregroundColor(.black)
            Text("Coordinates:   ")
                .font(.callout)
                .bold().foregroundColor(.black)
            if (content.clocation == nil) {
                Text("<no_name>").font(.callout).foregroundColor(.black).bold()
            } else {
                let str1 = String(content.clocation!.coordinate.latitude)
                let str2 = String(content.clocation!.coordinate.longitude)
                let str = "\(str1), \(str2)"
                Text(str).font(.callout).foregroundColor(.black).bold()
            }}
        .padding()
//        Spacer()
        HStack {
            Spacer()
            join
            Spacer()
        }
        Spacer(minLength: 80)
        }
        
    }
    }
}


//struct SingleEventView_Previews: PreviewProvider {
//    static var previews: some View {
//        SingleEventView()
//    }
//}
