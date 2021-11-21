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

    var body: some View {
        ZStack {
            Image("notiback")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
                .cornerRadius(20)
                .frame(width: 330.0, height: 120.0)
                .shadow(color: Color.green,  radius: 10.0, x: -10, y: 10)
            
            VStack (alignment: .leading) {

                Text(card.who + " is going to walk " + "at " + card.when)
                    .font(.title)
                    .foregroundColor(.blue)
                Text("Planned on: " + card.launched)
                    .font(.title)
                    .foregroundColor(.red)
            }
            .padding(20)
            .multilineTextAlignment(.center)
        }
        
}
}

struct FriendsEventView_Previews: PreviewProvider {
    static var previews: some View {
        FriendsEventView(card: Card.fevent)
    }
}
