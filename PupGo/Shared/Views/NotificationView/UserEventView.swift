//
//  UserEventView.swift
//  NotificationView
//
//  Created by Yuchen Liu on 11/10/21.
//

import SwiftUI

struct UserEventView: View {
    let card: Card
    @State private var isShowingAnswer = false
    @State private var isShowingDetailView = false
    let onActivate: () -> ()
    var content : Event =
        Event(userid: 1, username: "UglyDog", location: "UCLA GreenLand", starttime: "2021.11.8 3:00 pm", endtime: "2021.11.8 5:00 pm", image: Image("Dog1"))
    
    
    var body: some View {
        let pic = Image(card.pic)
                .resizable()
                .scaledToFill()
                .cornerRadius(20)
                .frame(width: 330.0, height: 120.0)
                .shadow(color: Color.green,  radius: 5.0, x: 10, y: -10)
        let back = RoundedRectangle(cornerRadius: 20, style: .circular)
            .shadow(color: Color.black, radius: 5.0 )
            .foregroundColor(.black.opacity(0.4))
            .frame(width: 330.0, height: 150.0)
        ZStack {
            pic
            
            if isShowingAnswer {
                back
                HStack(alignment: .center) {

                    
                    VStack (alignment: .leading) {
                        if isShowingAnswer {
                        Text("Start time: " + card.when)
                                .font(.body)
                            .foregroundColor(.white)
                        Text("Participants: " + card.who)
                            .font(.body)
                            .foregroundColor(.white)
                        Text("Scheduled at: " + card.launched)
                            .font(.body)
                            .foregroundColor(.white)
                            
                        }
                    }
                    .padding(20)
                    .multilineTextAlignment(.center)
                    
                    NavigationLink(destination: SingleEventView(content: content), isActive: $isShowingDetailView) {EmptyView()}
                    
                    Button(action: {
                                print("check event")
                                isShowingDetailView = true
                                self.onActivate()
                            
                        }
                                , label: {
                                Circle()
                                    .fill(Color.yellow)
                                    .frame(width: 75, height: 75)
                                    .shadow(radius: 10)
                                    .overlay(
                                        Image(systemName: "eyes")
                                            .font(.largeTitle)
                                            .foregroundColor(Color.black)
                                    )
                                
                                
                            }
                    )
                
                }
                
            }
            
        }
        .frame(width: 330.0, height: 120.0)
        .onTapGesture {
        self.isShowingAnswer.toggle()
    }
}
}
