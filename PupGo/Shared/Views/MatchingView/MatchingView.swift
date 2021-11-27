//
//  MatchingView.swift
//  PupGo
//
//  Created by Hsin-Wei Yu on 11/5/21.
//

import Foundation
import SwiftUI
import zlib

struct MatchView: View {
    @StateObject var obser = observer()
    @State var index = 0
    var body: some View {
        NavigationView {
            ZStack {
                lightYellowColor
                VStack {
                    
                    /* Image("dog1")
                        .resizable()
                        .frame(width: 360, height: 480) */
                    ZStack (alignment: .topLeading) {
                        if obser.users.isEmpty{
                            ProgressView()
                        }
                        
                        ForEach(self.obser.users) {i in
                            Group {
                                DogCard(dogCard: i)
                                    
                            }
                        }
                    }
                    
                    DecisionButtons()
                }
                
                
            }
            .edgesIgnoringSafeArea(.top)
        }
        .environmentObject(obser)
    }
    func indexUpdate() {
        self.index += 1
    }
}

struct DogCard: View {
    @State var dogCard: datatype
    @EnvironmentObject var obser: observer
    let cardGradient = Gradient(colors: [Color.black.opacity(0), Color.black.opacity(0.5)])
    
    var body: some View {
        ZStack (alignment: .leading) {
            AsyncImage(url: URL(string: dogCard.image)) { ima in
                ima.resizable().scaledToFit()
            } placeholder: {
                ProgressView()
            }
            Rectangle()
                .foregroundColor(.clear)
                .background(LinearGradient(gradient: cardGradient, startPoint: .top, endPoint: .bottom))
            /*
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
            .foregroundColor(.white)*/
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
                        self.obser.update(id: dogCard, x: value.translation.width, y: value.translation.height, degree: 7 * (value.translation.width > 0 ? 1: -1))
                        /*
                        dogCard.x = value.translation.width
                        dogCard.y = value.translation.height
                        dogCard.degree = 7 * (value.translation.width > 0 ? 1: -1)
                        */
                    }
                }
                .onEnded { value in
                    withAnimation(.interpolatingSpring(mass: 1.0, stiffness: 50, damping: 8, initialVelocity: 0)) {
                        switch value.translation.width {
                        case 0...100:
                            //self.obser.update(id: dogCard, x: 0, y: 0, degree: 0)
                            dogCard.x = 0; dogCard.degree = 0; dogCard.y = 0
                        case let x where x > 100:
                            //self.obser.update(id: dogCard, x: 500, y: dogCard.y, degree: 12)
                            dogCard.x = 500; dogCard.degree = 12
                        case (-100)...(-1):
                            //self.obser.update(id: dogCard, x: 0, y: 12, degree: 0)
                            dogCard.x = 0; dogCard.degree = 0; dogCard.y = 12
                        case let x where x < -100:
                            //self.obser.update(id: dogCard, x: -500, y: dogCard.y, degree: -12)
                            dogCard.x = -500; dogCard.degree = -12
                        default: //self.obser.update(id: dogCard, x: 0, y: 0, degree: dogCard.degree)
                            dogCard.x = 0; dogCard.y = 0
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
            Button(action: {
                if self.obser.last != -1 {
                    self.obser.goBack(index: self.obser.last)
                }
            }) {
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
