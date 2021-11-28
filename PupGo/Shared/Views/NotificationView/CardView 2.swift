//
//  CardView.swift
//  notify
//
//  Created by Yuchen Liu on 11/7/21.
//

import SwiftUI

struct CardView: View {
    let card: Card
    @State private var isShowingAnswer = false

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20, style: .circular)
                .shadow(radius: 10)
                .foregroundColor(.black.opacity(0.2))
                .frame(width: 330.0, height: 120.0)
            
            Image("notiback")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
                .cornerRadius(20)
                .frame(width: 330.0, height: 120.0)
            
            
            VStack (alignment: .leading) {

                Text(card.when)
                    .font(.title)
                    .foregroundColor(.gray)
                Text(card.who)
                    .font(.title)
                    .foregroundColor(.blue)
                Text(card.launched)
                    .font(.title)
                    .foregroundColor(.red)
            }
            .padding(20)
            .multilineTextAlignment(.center)
        }
        .frame(width: 330.0, height: 120.0)
        

        
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(card: Card.join)
    }
}
