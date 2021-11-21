//
//  NotificationView.swift
//  PupGo
//
//  Created by Hsin-Wei Yu on 11/5/21.
//

import Foundation
import SwiftUI

struct NotificationView: View {
    
    var body: some View {
        NavigationView {
            ZStack {
                lightYellowColor.edgesIgnoringSafeArea(.all)
                
                VStack(alignment: .leading) {
                    Spacer()
                    Join()
                    UEvent()
                    FEvent()
                }
                .frame(width: UIScreen.main.bounds.width - 40, height: UIScreen.main.bounds.height - 200)
                .padding(.bottom, 200)
                Spacer()
            }
            
        }
    }
}

extension View {
    func stacked(at position: Int, in total: Int) -> some View {
        let offset = CGFloat(total - position)
        return self.offset(CGSize(width: 0, height: offset * 10))
    }
}

struct Join: View {
    @State private var joins = [Card](repeating: Card.join, count: 3)
    
    var body: some View{
        VStack{
                
            HStack( alignment: .top, spacing: 12) {
                Button(action:{
                        print("pass request")
                        joins.removeFirst(1)
                    }) {
                        Text("No")
                }
                    Text("Wanna Join")
                        .font(.system(size: 20))
                        .fontWeight(.bold)
                        .foregroundColor(.red)
                    
                Button(action:{
                    print("pass request")
                    joins.removeFirst(1)
                }){
                    Text("Ok")
                }
            }
                
            
                ZStack {
                    VStack {
                        ZStack {
                            ForEach(0..<joins.count, id: \.self) { index in
                                JoinRequestView(card: self.joins[index])
                                    .stacked(at: index, in: self.joins.count)
                            }
                        }
                    }
                    
                }
                
            Spacer(minLength: 5)
        }
    }
}

struct UEvent: View {
    
    @State private var uevents = [Card](repeating: Card.uevent, count: 1)
    
    var body: some View{
        VStack{
                
                
            HStack( alignment: .top, spacing: 12) {
            
                    Text("Gonna go")
                        .font(.system(size: 20))
                        .fontWeight(.bold)
                        .foregroundColor(.blue)
                    
                    Button(action:{
                        print("Go to Your Event Page")
                    }
                    ){
                        Text("Check it out")
                    }
                }
            
                ZStack {
                    VStack {
                        ZStack {
                            ForEach(0..<uevents.count, id: \.self) { index in
                                UserEventView(card: self.uevents[index])
                                    .stacked(at: index, in: self.uevents.count)
                            }
                        }
                    }
                    
                }
                
            Spacer(minLength: 5)
        }
    }
}

struct FEvent: View {
    @State private var fevents = [Card](repeating: Card.fevent, count: 5)
    
    var body: some View{
        VStack{
                
            HStack( alignment: .top, spacing: 12) {
                    
                    Button(action:{
                        print("Don't join friend's event")
                        fevents.removeFirst(1)
                    }){
                        Text("Refuse")}
                        
                    Text("Your Are Invited")
                        .font(.system(size: 20))
                        .fontWeight(.bold)
                        .foregroundColor(.green)
                    
                    Button(action:{
                        print("Join friend's event")
                        fevents.removeFirst(1)
                    }){
                        Text("Accept")
                    }
                }
            
                ZStack {
                    VStack {
                         ZStack {
                            ForEach(0..<fevents.count, id: \.self) { index in
                                FriendsEventView(card: self.fevents[index])
                                    .stacked(at: index, in: self.fevents.count)
                            }
                        }
                    }
                    
                }
                
            Spacer(minLength: 5)
        }
    }
}
