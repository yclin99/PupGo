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
    @State var index: String = ""
    var body: some View {
        NavigationView {
            ZStack {
                lightYellowColor
                
                Loader()
                VStack {
                    
                    /* Image("dog1")
                        .resizable()
                        .frame(width: 360, height: 480) */
                    ZStack (alignment: .topLeading) {
                        if obser.users.count == 1{
                            ProgressView()
                        }
                        
                        
                        ForEach(self.obser.users) {i in
                            Group {
                                DogCard(id: i.id, name: i.name, image: i.image, age: i.age)
                                    .environmentObject(obser)
                                
                            }
                        }
                    }
                    
                    DecisionButtons(index: self.$index).environmentObject(obser)
                }
                
                
            }
            .edgesIgnoringSafeArea(.top)
        }
        //.environmentObject(obser)
    }
    func indexUpdate(id: String) {
        self.index = id
    }
}

struct DogCard: View {
    //@State var dogCard: datatype
    @State var id: String
    @State var name: String
    @State var image: String
    @State var age: String
    @EnvironmentObject var obser: observer
    let cardGradient = Gradient(colors: [Color.black.opacity(0), Color.black.opacity(0.5)])
    
    var body: some View {
        //VStack {
            ZStack (alignment: .leading) {
                ImageLoaderView(url: self.image)
                
                Rectangle()
                    .foregroundColor(.clear)
                    .background(LinearGradient(gradient: cardGradient, startPoint: .top, endPoint: .bottom))
                
                VStack {
                    Spacer()
                    VStack(alignment: .leading) {
                        HStack {
                            Text(self.name).font(.largeTitle).fontWeight(.bold)
                            Text(String(self.age)).font(.title)
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
            .offset(x: self.obser.getX(id: self.id), y: self.obser.getY(id: self.id))
            .rotationEffect(.init(degrees: self.obser.getD(id: self.id)))
            // Gesture Recogniser update
            .gesture(
                DragGesture()
                    .onChanged { value in
                        withAnimation(.default) {
                            //dogCard.x = value.translation.width
                            //dogCard.y = value.translation.height
                            //dogCard.degree = 7 * (value.translation.width > 0 ? 1: -1)
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
                                self.obser.update(id: self.id, x: 500, y: self.obser.getY(id: self.id), degree: 12)
                                self.obser.updateDB(recommendID: self.id, result: true)
                                
                                DispatchQueue.main.asyncAfter(deadline: .now() + seconds) {
                                    self.obser.users.removeLast()
                                }
                                
                            case (-100)...(-1):
                                self.obser.update(id: self.id, x: 0, y: 12, degree: 0)
                            case let x where x < -100:
                                self.obser.update(id: self.id, x: -500, y: self.obser.getY(id: self.id), degree: -12)
                                self.obser.updateDB(recommendID: self.id, result: false)
                                DispatchQueue.main.asyncAfter(deadline: .now() + seconds) {
                                    self.obser.users.removeLast()
                                }
                            default:
                                self.obser.update(id: self.id)
                                self.obser.update(id: self.id, x: 0, y: 0, degree: self.obser.getD(id: self.id))
                            }
                            self.obser.update(id: self.id)
                        }
                    }
            )
       // }
    }
    /*
    func update(x: CGFloat, y: CGFloat, d: Double) {
        .x = x
        dogCard.y = y
        dogCard.degree = d
    }*/
}

struct Loader: UIViewRepresentable{
    func makeUIView(context: UIViewRepresentableContext<Loader>) -> UIActivityIndicatorView {
        let indicator = UIActivityIndicatorView(style: .large)
        indicator.startAnimating()
        return indicator
    }
    
    func updateUIView(_ uiView: UIActivityIndicatorView, context: UIViewRepresentableContext<Loader>) {
        
    }
}

struct DecisionButtons: View {
    @Binding var index: String
    @EnvironmentObject var obser: observer
    var body: some View {
        Text(" ")
        
        HStack {
            Spacer()
            Button(action: {
                self.obser.update(id: self.index, x: 500, y: 0, degree: 12)
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                    self.obser.users.removeLast()
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
            Button(action: {
                self.obser.updateDB(recommendID: obser.users.first!.id, result: true)
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                    self.obser.users.removeLast()
                }
            }) {
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
