//
//  EventExploreContentView.swift
//  PupGo_TextField
//
//  Created by ace_ye on 11/2/21.
//

import SwiftUI

struct EventExploreContentView: View {
    var eventview: some View {
        HStack (alignment: .center) {
            Spacer()
            Image("Dog1").resizable().scaledToFit()
            VStack (alignment: .leading) {
                    Text("username : tobby").foregroundColor(.black)
                    Text("location : UCLA greenland").foregroundColor(.black)
                    Text("Start from 3 pm. today").foregroundColor(.black)
            }.padding()
            Spacer()
            }
        }
    
    var body: some View {
        ScrollView {
        VStack{
            eventview
        }
        }
    }
}

struct EventExploreContentView_Previews: PreviewProvider {
    static var previews: some View {
        EventExploreContentView()
    }
}
