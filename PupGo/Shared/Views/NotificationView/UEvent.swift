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
        Event(userid: 1, username: "UglyDog", location: "UCLA GreenLand", starttime: "2021.11.8 3:00 pm", endtime: "2021.11.8 5:00 pm", image: Image("Dog1"))
    
    var body: some View{
        if uevents.count > 0 {
            VStack{
                
                
            HStack( alignment: .top, spacing: 12) {
            
                    Text("Next Event Coming Up")
                        .font(.system(size: 30))
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                    
                }
            
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
                
            Spacer(minLength: 5)
        }
        }
        
    }
    func getApi() {
        print("getApi called")
        
        //if self.uevents.count > 0 {
          //  uevents.removeFirst(1)
        }
        
}
