//
//  FriendsEventView.swift
//  NotificationView
//
//  Created by Yuchen Liu on 11/10/21.
//

import SwiftUI

struct FriendsEventView: View {

    let card: Card
    @State private var isShowingAnswer = false
    let onActivate: () -> ()
    var content : Event =
        Event(userid: 1, username: "UglyDog", location: "UCLA GreenLand", starttime: "2021.11.8 3:00 pm", endtime: "2021.11.8 5:00 pm", image: Image("Dog1"))
    @State private var isShowingDetailView = false
    
    var body: some View {
        let pic = Image(card.pic)
                .resizable()
                .scaledToFill()
                .cornerRadius(20)
                .frame(width: 330.0, height: 120.0)
                .shadow(color: Color.blue,  radius: 10.0, x: -10, y: 10)
        let back = RoundedRectangle(cornerRadius: 20, style: .circular)
            .shadow(color: Color.black, radius: 10.0 )
            .foregroundColor(.black.opacity(0.4))
            .frame(width: 330.0, height: 150.0)
        
        ZStack {
            pic
            
            if isShowingAnswer {
                back
                VStack (alignment: .leading) {
                    Text(card.who + " invited you!")
                        .font(.body)
                        .foregroundColor(.white)
                    
                    NavigationLink(destination: SingleEventView(content: content), isActive: $isShowingDetailView) {EmptyView()}
                    
                    HStack (alignment: .center) {
                        Button(action: {
                            print("accept")
                            self.onActivate()
                        }
                            , label: {
                            Circle()
                                .fill(Color.white)
                                .frame(width: 75, height: 75)
                                .shadow(radius: 10)
                                .overlay(
                                    Image(systemName: "heart")
                                        .font(.largeTitle)
                                        .foregroundColor(Color.red)
                                )
                            
                            
                        })
                        
                        Button(action: {
                            print("check")
                            isShowingDetailView = true
                        }
                            , label: {
                            Circle()
                                .fill(Color.white)
                                .frame(width: 75, height: 75)
                                .shadow(radius: 10)
                                .overlay(
                                    Image(systemName: "eye")
                                        .font(.largeTitle)
                                        .foregroundColor(Color.blue)
                                )
                            
                            
                        })
                        
                        Button(action: {
                            print("decline invitation")
                            self.onActivate()
                        }
                            , label: {
                            Circle()
                                .fill(Color.black)
                                .frame(width: 75, height: 75)
                                .shadow(radius: 10)
                                .overlay(
                                    Image(systemName: "hand.thumbsdown")
                                        .font(.largeTitle)
                                        .foregroundColor(Color.green)
                                )
                            
                            
                        })
                    }
                    
                    }
                .padding(20)
                .multilineTextAlignment(.center)
                
            }
                
        }
        .frame(width: 330.0, height: 120.0)
        .onTapGesture {
            self.isShowingAnswer.toggle()
}
}
    

}
