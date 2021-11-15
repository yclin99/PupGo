//
//  JoinRequestView.swift
//  NotificationView
//
//  Created by Yuchen Liu on 11/10/21.
//

import SwiftUI

struct JoinRequestView: View {
    
    let card: Card
    @State private var isShowingAnswer = false

    var body: some View {
        ZStack {
            
            Image("upcoming")
                .resizable()
                .scaledToFill()
                .cornerRadius(20)
                .frame(width: 330.0, height: 120.0)
                .shadow(color: Color.red,  radius: 10.0, x: 10, y: -10)
            
            
            VStack (alignment: .leading) {

                Text(card.who)
                    .font(.title)
                    .foregroundColor(.red)
            }
            .padding(20)
            .multilineTextAlignment(.center)
        }
        .frame(width: 330.0, height: 120.0)
    
    }
}

struct JoinRequestView_Previews: PreviewProvider {
    static var previews: some View {
        JoinRequestView(card: Card.join)
    }
}
