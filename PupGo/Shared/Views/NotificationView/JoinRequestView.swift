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
    let onActivate: () -> ()
    
    var body: some View {
        let pic = Image(card.pic)
                .resizable()
                .scaledToFill()
                .cornerRadius(20)
                .frame(width: 330.0, height: 120.0)
                .shadow(color: Color.red,  radius: 5.0, x: 10, y: -10)
        let back = RoundedRectangle(cornerRadius: 20, style: .circular)
            .shadow(color: Color.black, radius: 5.0 )            .foregroundColor(.black.opacity(0.2))
            .frame(width: 330.0, height: 150.0)
        
        ZStack {
            pic
            
            if isShowingAnswer {
                back
                HStack(alignment: .center) {
                    
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
                                Image(systemName: "heart.fill")
                                    .font(.largeTitle)
                                    .foregroundColor(Color.red)
                            )
                        
                        
                    })
                    
                    VStack (alignment: .leading) {

                        Text(card.who)
                            .font(.title)
                            .foregroundColor(.red)
                    }
                    .padding(20)
                    .multilineTextAlignment(.center)
                    
                    Button(action: {
                        print("deny")
                        self.onActivate()
                        
                    }
                        , label: {
                        Circle()
                            .fill(Color.black)
                            .frame(width: 75, height: 75)
                            .shadow(radius: 10)
                            .overlay(
                                Image(systemName: "hand.thumbsdown.fill")
                                    .font(.largeTitle)
                                    .foregroundColor(Color.green)
                            )
                        
                        
                    })
        }
        .frame(width: 330.0, height: 120.0)
    
    }
}
        .frame(width: 330.0, height: 120.0)
        .onTapGesture {
            self.isShowingAnswer.toggle()
        }
    }}
