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
    @State var index: String = ""
    @State var showModal = false
    var body: some View {
        NavigationView {
            ZStack {
                lightYellowColor
                VStack {
                    ZStack (alignment: .topLeading) {
                        if obser.users.isEmpty {
                            ProgressView()
                        }
                        else if obser.users.count == 1 {
                            ProgressView()
                                .onAppear {
                                    self.obser.getNewUsers()
                                }
                        } else {

                            ForEach(self.obser.users) {i in
                                Group {
                                    DogCardView(id: i.id, name: i.name, image: i.image, age: i.age)
                                        .environmentObject(obser)
                                }
                            }
                        }
                    }
                    DecisionButtons(index: self.$index, infoModal: self.$showModal).environmentObject(obser)
                }
                DogInfoView(isShowing: $showModal)
            }
            //.padding(.bottom, 60)
            //.padding(.bottom, getSafeArea().bottom == 0 ? 15 : getSafeArea().bottom)
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
    @Binding var index: String
    @Binding var infoModal: Bool
    @EnvironmentObject var obser: observer
    var body: some View {
        
        HStack {
            Spacer()
            Button(action: {
                self.obser.update(id: self.index, x: 500, y: 0, degree: 12)
                self.obser.updateDB(recommendID: self.index, result: false)
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                    self.obser.users.removeLast()
                }
            }) {
                Image(systemName: "x.circle")
                    .resizable()
                    .foregroundColor(deepPinkColor)
                    .frame(width: 45, height: 45)
            }
            Spacer()
            Button(action: {
                infoModal = true
            }) {
                Image(systemName: "info.circle.fill")
                    .resizable()
                    .foregroundColor(.brown)
                    .frame(width: 45, height: 45)
            }
            Spacer()
            Button(action: {
                self.obser.updateDB(recommendID: self.index, result: true)
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                    self.obser.users.removeLast()
                }
            }) {
                Image(systemName: "checkmark.circle")
                    .resizable()
                    .foregroundColor(greenColor)
                    .frame(width: 45, height: 45)
            }
            Spacer()
        }
        .padding(.top, 40)
    }
}

/*
struct MatchView_Previews: PreviewProvider {
    static var previews: some View {
        MatchView()
    }
}*/
