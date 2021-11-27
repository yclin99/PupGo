//
//  MatchingView.swift
//  PupGo
//
//  Created by Hsin-Wei Yu on 11/5/21.
//

import Foundation
import SwiftUI

struct MatchView: View {
    @StateObject var obser = observer()
    var body: some View {
        NavigationView {
            ZStack {
                lightYellowColor
                VStack {
                    
                    Image("dog1")
                        .resizable()
                        .frame(width: 360, height: 480)
                     
                    if obser.users.isEmpty{
                        ProgressView()
                    }
                    /*
                    ForEach(self.obser.users) {i in
                        Group {
                            DogCard(dogCard: i)
                        }
                    }*/
                    DecisionButtons()
                }
                
                
            }
            .edgesIgnoringSafeArea(.top)
        }
        .environmentObject(obser)
    }
}

struct DogCard: View {
    @State var dogCard: datatype
    //@EnvironmentObject var obser: observer
    let cardGradient = Gradient(colors: [Color.black.opacity(0), Color.black.opacity(0.5)])
    var body: some View {
        ZStack (alignment: .leading) {
            AsyncImage(url: URL(string: dogCard.image)) { ima in
                ima.resizable().scaledToFit()
            } placeholder: {
                ProgressView()
            }
            /*
            Rectangle()
                .foregroundColor(.clear)
                .background(LinearGradient(gradient: cardGradient, startPoint: .top, endPoint: .bottom))*/
            VStack {
                Spacer()
                VStack(alignment: .leading) {
                    HStack {
                        Text(dogCard.name).font(.largeTitle).fontWeight(.bold)
                        Text(String(dogCard.age)).font(.title)
                    }
                    // Text(dogCard.bio)
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
    @EnvironmentObject var obser: observer
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
