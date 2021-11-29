//
//  UEvent.swift
//  PupGo
//
//  Created by Yuchen Liu on 11/22/21.
//

import Foundation
import SwiftUI

struct UEvent: View {
    
    @State var uevents = Card.uevent

    var content : Event =
    Event(userid: "", username: "UglyDog", location: "UCLA GreenLand", starttime: "2021.11.8 3:00 pm", endtime: "2021.11.8 5:00 pm", image: Image("Dog1"), type: 0)

    
    var body: some View{
            VStack{
                
            if uevents.count > 0 {
                ZStack {
                    VStack {
                        ZStack {
                            ForEach(0..<uevents.count, id: \.self) { index in
                                UserEventView(card: self.uevents[index], onActivate: getApi)
                                    .stacked(at: index, in: self.uevents.count)
                            }
                        }
                    }
                    
                }
            }
            Spacer()
    }
    }
    func getApi() {
        print("getApi called")
        
        //if self.uevents.count > 0 {
          //  uevents.removeFirst(1)
        }
        
}
