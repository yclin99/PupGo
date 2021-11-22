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
                lightYellowColor.ignoresSafeArea()
                VStack(alignment: .leading) {
                    Spacer()
                    Join()
                    UEvent()
                    FEvent()
                }
                .frame(width: UIScreen.main.bounds.width - 40, height: UIScreen.main.bounds.height - 240)
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
    @State var joins = [Card](repeating: Card.join, count: 1)
    
    var body: some View{
        VStack{
            Text("Someone wants to Join your event!")
                .font(.system(size: 20))
                .fontWeight(.bold)
                .foregroundColor(.black)
                .opacity(joins.count > 0 ? 1 : 0)
            
            if joins.count > 0 {

                ZStack {
                    VStack {
                        ZStack {
                            ForEach(0..<joins.count, id: \.self){ index in
                                JoinRequestView(card: self.joins[index], onActivate: getApi)
                                    .stacked(at: index, in: self.joins.count)
                                
                                }
                            
                            }
                        }
                    }
                }
                
            Spacer(minLength: 5)
        }
        .foregroundColor(.blue)
    }
    func getApi() {
        print("getApi called")
        if self.joins.count > 0 {
            joins.removeFirst(1)
        }
        
    }
}

struct UEvent: View {
    
    @State var uevents = [Card](repeating: Card.uevent, count: 1)
    
    var body: some View{
        if uevents.count > 0 {
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
        if self.uevents.count > 0 {
            uevents.removeFirst(1)
        }
        
    }
}

struct FEvent: View {
    @State var fevents = [Card](repeating: Card.fevent, count: 5)
    
    var body: some View{
        if fevents.count > 0 {
            VStack{
                    

                    Text("Your Friend Invited You!")
                        .font(.system(size: 20))
                        .fontWeight(.bold)
                        .foregroundColor(.blue)
                        

                
                    ZStack {
                        VStack {
                             ZStack {
                                 ForEach(0..<fevents.count, id: \.self) { index in
                                    FriendsEventView(card: fevents[index], onActivate: getApi)
                                        .stacked(at: index, in: fevents.count)
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
        if self.fevents.count > 0 {
            fevents.removeFirst(1)
        }
        
    }
}

struct NotificationView_Previews: PreviewProvider {
    static var previews: some View {
        NotificationView()
    }
}
