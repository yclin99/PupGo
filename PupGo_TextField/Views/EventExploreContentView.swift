//
//  EventExploreContentView.swift
//  PupGo_TextField
//
//  Created by wenye on 11/2/21.
//

import SwiftUI

struct EventExploreContentView: View {
    
    var events = [Event(userid: 1, username: "UglyDog", location: "UCLA GreenLand", starttime: "xx", endtime: "xx", image: Image("Dog1")), Event(userid: 2, username: "Pluto", location: "DisneyLand Park", starttime: "xx", endtime: "xx", image: Image("Dog2")), Event(userid: 3, username: "Goofy", location: "Mickey's home", starttime: "xx", endtime: "xx", image: Image("Dog3"))]

    var eventsCount: Int = 3
    
    var body: some View {
        ZStack {
            Color(#colorLiteral(red: 1, green: 1, blue: 0.88, alpha: 255)).edgesIgnoringSafeArea(.all)
            VStack {
                ScrollView {
                    VStack (alignment: .leading, spacing: 30){
                        ForEach(events[0..<eventsCount], id: \.self, content: {event in
                    EventView(content: event)
                    })
                }
            }
            BottomView()
            }
        }
    }
}

struct EventView: View {
    
    var content : Event
    
    var body: some View {
        HStack (alignment: .center) {
            content.image.resizable()
                .scaledToFit()
                .frame(width: 120, height: 120)
            VStack (alignment: .leading, spacing: 10) {
                HStack(alignment: .center) {
                    Image(systemName: "pawprint.circle").font(.largeTitle)
                    Text(content.username).font(.callout).foregroundColor(.black).bold()}
                HStack(alignment: .center) {
                    Image(systemName: "location").font(.largeTitle)
                    Text(content.location).foregroundColor(.black)}
            }.padding()
        }
    }
}


struct EventExploreContentView_Previews: PreviewProvider {
    static var previews: some View {
        EventExploreContentView()
    }
}


