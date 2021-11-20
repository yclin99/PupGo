//
//  EventExploreContentView.swift
//  PupGo_TextField
//
//  Created by wenye on 11/2/21.
//

import SwiftUI

struct EventExploreContentView: View {
        
    var events = [
        Event(userid: 1, username: "UglyDog", location: "UCLA GreenLand", starttime: "2021.11.8 3:00 pm", endtime: "2021.11.8 5:00 pm", image: Image("Dog1")),
        Event(userid: 2, username: "Pluto", location: "DisneyLand Park", starttime: "2021.11.8 3:00 pm", endtime: "2021.11.8 5:00 pm", image: Image("Dog2")),
        Event(userid: 3, username: "Goofy", location: "Mickey's home",starttime: "2021.11.8 3:00 pm", endtime: "2021.11.8 5:00 pm", image: Image("Dog3")),
        Event(userid: 4, username: "Jiff", location: "Santa Monica", starttime: "2021.11.8 3:00 pm", endtime: "2021.11.8 5:00 pm", image: Image("Jiff")),
        Event(userid: 5, username: "Boo", location: "Big Sur", starttime: "2021.11.8 3:00 pm", endtime: "2021.11.8 5:00 pm", image: Image("Boo")),
        Event(userid: 6 ,username: "Doug", location: "Los Angles", starttime: "2021.11.8 3:00 pm", endtime: "2021.11.8 5:00 pm",  image: Image("Doug")),
        Event(userid: 7 ,username: "Maru the Shiba", location: "Department store in Japan", starttime: "2021.11.8 3:00 pm", endtime: "2021.11.8 5:00 pm", image: Image("Maru"))]

    var eventsCount: Int = 7
    
    var AddEventView: some View {
        HStack (alignment: .center){
        NavigationLink(destination: CreateEventContentView()) { Image(systemName: "plus.app").font(.largeTitle)
        }
        }
    }
    
    var body: some View {
        NavigationView {
         ZStack {
            lightYellowColor
                 .edgesIgnoringSafeArea(.all)
             VStack(alignment: .center, spacing: 30) {
//                Spacer(minLength: 30)
                HStack {
                    Text("Nearby Event")
                        .font(.system(size: 35))
                        .bold().foregroundColor(.black)
                    AddEventView.foregroundColor(.black)
                }
                ScrollView {
                        LazyVStack (alignment: .leading, spacing: 30) {
                        ForEach(events[0..<eventsCount], id: \.self, content: {event in
                        EventView(content: event)
                        })
                        }
                    }
                }
//             .edgesIgnoringSafeArea(.all)
                .padding(.bottom, 70.0)
                .frame(width: 360, height: 680)
          }
        }
    }
}


struct EventView: View {
    
    var content : Event
    @State private var isPresented = false
    
    var body: some View {
        HStack (alignment: .center) {
            NavigationLink(destination: SingleEventView(content: content)) { content.image.resizable()
            .scaledToFit()
                .frame(width: 120, height: 120)}
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
//        var events = [Event(userid: 1, username: "UglyDog", location: "UCLA GreenLand", starttime: "xx", endtime: "xx", image: Image("Dog1"))]
        EventExploreContentView()
.previewInterfaceOrientation(.portrait)
//        SingleEventView(content: events[0])
    }
}


