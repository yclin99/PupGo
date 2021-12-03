//
//  DogCardView.swift
//  PupGo
//
//  Created by Hsin-Wei Yu on 11/27/21.
//

import SwiftUI

struct DogCardView: View {
    //@State var dogCard: datatype
    @State var id: String
    @State var name: String
    @State var image: String
    @State var age: Int
    @EnvironmentObject var obser: observer
    let cardGradient = Gradient(colors: [Color.black.opacity(0), Color.black.opacity(0.5)])
    
    var body: some View {
        //VStack {
            ZStack (alignment: .topLeading) {
                //ImageLoaderView(url: self.image)
                
                Rectangle()
                    .overlay(ImageLoaderView(url: self.image))
                    .foregroundColor(.clear)
                    .background(.black)
                    //.background(LinearGradient(gradient: cardGradient, startPoint: .top, endPoint: .bottom))
                    
                
                VStack {
                    Spacer()
                    VStack(alignment: .leading) {
                        Text(self.name).font(.largeTitle).fontWeight(.bold)
                        HStack {
                            Text(String(self.age)).font(.title)
                            Text("yrs").font(.title)
                        }
                        // Text(dogCard.bio)
                    }
                    .padding(.horizontal, 20)
                }
                .padding()
                .foregroundColor(.white)
                
                HStack {
                    Image("Woof")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 150)
                        .opacity(Double(self.obser.getX(id: self.id)/10 - 1))
                        .padding(.horizontal, 20)
                    
                    Image("Poop-2")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 150)
                        .opacity(Double(self.obser.getX(id: self.id) * -1 - 1))
                        
                }
                .padding(.horizontal, 20)
                .padding(.top, 30)
                
            }
            .frame(width: 360, height: 480)
            .cornerRadius(20)
            // Dealing with swiping
            .offset(x: self.obser.getX(id: self.id), y: self.obser.getY(id: self.id))
            .rotationEffect(.init(degrees: self.obser.getD(id: self.id)))
            // Gesture Recogniser update
            .gesture(
                DragGesture()
                    .onChanged { value in
                        withAnimation(.default) {
                            self.obser.update(id: self.id, x: value.translation.width, y: value.translation.height, degree: 7 * (value.translation.width > 0 ? 1: -1))
                        }
                    }
                    .onEnded { value in
                        withAnimation(.interpolatingSpring(mass: 1.0, stiffness: 50, damping: 8, initialVelocity: 0)) {
                            let seconds = 0.5
                            switch value.translation.width {
                            case 0...100:
                                self.obser.update(id: self.id, x: 0, y: 0, degree: 0)
                                
                            case let x where x > 100:
                                self.obser.update(id: self.id, x: 500, degree: 12)
                                self.obser.updateDB(recommendID: self.id, result: true)
                                
                                DispatchQueue.main.asyncAfter(deadline: .now() + seconds) {
                                    self.obser.users.removeLast()
                                }
                                
                            case (-100)...(-1):
                                self.obser.update(id: self.id, x: 0, y: 12, degree: 0)
                            case let x where x < -100:
                                self.obser.update(id: self.id, x: -500, degree: -12)
                                self.obser.updateDB(recommendID: self.id, result: false)
                                DispatchQueue.main.asyncAfter(deadline: .now() + seconds) {
                                    self.obser.users.removeLast()
                                }
                            default:
                                self.obser.update(id: self.id)
                                self.obser.update(id: self.id, x: 0, y: 0)
                            }
                            self.obser.update(id: self.id)
                        }
                    }
            )
    }
}
