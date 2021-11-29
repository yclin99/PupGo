//
//  EventExploreContentView.swift
//  PupGo_TextField
//
//  Created by wenye on 11/2/21.
//

import SwiftUI

struct EventExploreContentView: View {
    
    @StateObject var eventsFamily = Events()
    /*init() {
        eventsFamily.setParameter()
    }*/
    
    var AddEventView: some View {
        HStack (alignment: .center){
        NavigationLink(destination: CreateEventContentView()) { Image(systemName: "plus.app").font(.largeTitle)
        }
        }
    }
    
    var body: some View {
        NavigationView {

            ZStack {
                lightYellowColor.edgesIgnoringSafeArea(.all)
                VStack {
                    ScrollView {
                        LazyVStack (alignment: .leading, spacing: 30) {
                            Spacer()
                            ForEach(eventsFamily.events) { index in
                                Group {
                                    EventView(content: index)
                                }
                                // EventView(content: eventsFamily.events[index])
                            }
                        }
                        .padding(.bottom, 60)
                        .padding(.bottom, getSafeArea().bottom == 0 ? 15 : getSafeArea().bottom)
                    }
                }

                .frame(width: UIScreen.main.bounds.width - 40, height: UIScreen.main.bounds.height)
                Spacer(minLength: 60)
                HStack {
                    Spacer()
                    AddEventView.foregroundColor(.black)
                }
                
            }
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarTitle("EXPLORE NEARBY")

        }
        .foregroundColor(.black)
    }
}


struct EventView: View {
    
    var content : Event
    @State private var isPresented = false
    
    var body: some View {
        HStack (alignment: .center) {
            NavigationLink(destination: SingleEventView(content: content)) { content.image!.resizable()
            .scaledToFit()
                .frame(width: 120, height: 120)}
        VStack (alignment: .leading, spacing: 10) {
//            HStack(alignment: .center) {
//                Image(systemName: "pawprint.circle").font(.largeTitle)
//                Text(content.username).font(.callout).foregroundColor(.black).bold()}
            TypeEventView(type: 1, content: content)
            HStack(alignment: .center) {
                Image(systemName: "location").font(.largeTitle)
                Text(content.location).foregroundColor(.black)}
            }.padding()
        }
    }
}


struct TypeEventView: View {
    var type : Int
    var content : Event
    var body: some View {
        HStack(alignment: .center) {
            if (type == 0) {
                Image(systemName: "pawprint.circle").font(.largeTitle)
            } else if (type == 1) {
                Image(systemName: "gift.circle").font(.largeTitle)
            } else if (type == 2) {
                Image(systemName: "r.joystick.tilt.up.fill").font(.largeTitle)
            } else {
                Image(systemName: "heart.text.square").font(.largeTitle)
            }
            Text(content.username).font(.callout).foregroundColor(.black).bold()}
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


