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
    @State var showModal = false
    var body: some View {
        NavigationView {
            ZStack {
                lightYellowColor
                
                Loader()
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
                DogInfoView(isShowing: $showModal).environmentObject(obser)
            }
            .edgesIgnoringSafeArea(.top)
        }
    }
    func indexUpdate(id: String) {
        self.index = id
    }
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
            .buttonStyle(PlainButtonStyle())
            
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
