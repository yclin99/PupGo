//
//  MatchingView.swift
//  PupGo
//
//  Created by Hsin-Wei Yu on 11/5/21.
//

import Foundation
import SwiftUI

struct MatchView: View {
    
    var body: some View {
        NavigationView {
            ZStack {
                lightYellowColor
                VStack {
                    Spacer()
                    ZStack {
                        ForEach(SwipeCard.data.reversed()) { card in
                            DogCard(dogCard: card)
                        }
                    }
                    Spacer()
                    DecisionButtons()
                    Spacer()
                }
            }
            .edgesIgnoringSafeArea(.top)
            //.navigationTitle("Matching")
        }
    }
}

struct DogCard: View {
    @State var dogCard: SwipeCard
    let cardGradient = Gradient(colors: [Color.black.opacity(0), Color.black.opacity(0.5)])
    var body: some View {
        ZStack (alignment: .leading) {
            Image(dogCard.imageName)
                //.resizable()
                .scaledToFit()
                //.aspectRatio(contentMode: .fit)
            Rectangle()
                .foregroundColor(.clear)
                .background(LinearGradient(gradient: cardGradient, startPoint: .top, endPoint: .bottom))
            VStack {
                Spacer()
                VStack(alignment: .leading) {
                    HStack {
                        Text(dogCard.name).font(.largeTitle).fontWeight(.bold)
                        Text(String(dogCard.age)).font(.title)
                    }
                    Text(dogCard.bio)
                }
            }
            .padding()
            .foregroundColor(.white)
        }
        .frame(width: 360, height: 480)
        .cornerRadius(20)
        // Dealing with swiping
        .offset(x: dogCard.x, y: dogCard.y)
        .rotationEffect(.init(degrees: dogCard.degree))
        
        // Gesture Recogniser update
        .gesture(
            DragGesture()
                .onChanged { value in
                    withAnimation(.default) {
                        dogCard.x = value.translation.width
                        dogCard.y = value.translation.height
                        dogCard.degree = 7 * (value.translation.width > 0 ? 1: -1)
                    }
                }
                .onEnded { value in
                    withAnimation(.interpolatingSpring(mass: 1.0, stiffness: 50, damping: 8, initialVelocity: 0)) {
                        switch value.translation.width {
                        case 0...100:
                            dogCard.x = 0; dogCard.degree = 0; dogCard.y = 0
                        case let x where x > 100:
                            dogCard.x = 500; dogCard.degree = 12
                        case (-100)...(-1):
                            dogCard.x = 0; dogCard.degree = 0; dogCard.y = 12
                        case let x where x < -100:
                            dogCard.x = -500; dogCard.degree = -12
                        default: dogCard.x = 0; dogCard.y = 0
                        }
                    }
                }
        )
    }
}

struct DecisionButtons: View {
    var body: some View {
        HStack {
            Spacer()
            Button(action: {}) {
                Image(systemName: "x.circle.fill")
                    .resizable()
                    .foregroundColor(.brown)
                    .frame(width: 40, height: 40)
            }
            Spacer()
            Button(action: {}) {
                Image(systemName: "info.circle.fill")
                    .resizable()
                    .foregroundColor(.brown)
                    .frame(width: 40, height: 40)
            }
            Spacer()
            Button(action: {}) {
                Image(systemName: "pawprint.fill")
                    .resizable()
                    .foregroundColor(.brown)
                    .frame(width: 40, height: 40)
            }
            Spacer()
        }
    }
}

struct MatchView_Previews: PreviewProvider {
    static var previews: some View {
        MatchView()
    }
}
