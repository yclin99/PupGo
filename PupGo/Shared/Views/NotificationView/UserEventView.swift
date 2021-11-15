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

    var body: some View {
        ZStack {
            
            Image("request2join")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
                .cornerRadius(20)
                .frame(width: 330.0, height: 120.0)
                .shadow(color: Color.blue, radius: 10.0, x: 10, y: 1)
            
            VStack (alignment: .leading) {

                Text("Start time: " + card.when)
                    .font(.title)
                    .foregroundColor(.black)
                Text("Participants: " + card.who)
                    .font(.title)
                    .foregroundColor(.orange)
                Text("Launched: " + card.launched)
                    .font(.title)
                    .foregroundColor(.red)
            }
            .padding(20)
            .multilineTextAlignment(.center)
        }
        .frame(width: 330.0, height: 120.0)
    
    }
}

struct UserEventView_Previews: PreviewProvider {
    static var previews: some View {
        UserEventView(card: Card.uevent)
    }
}
