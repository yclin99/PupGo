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
                    ZStack (alignment: .topLeading) {
                        if obser.users.isEmpty {
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
                    DecisionButtons(index: self.$index).environmentObject(obser)
                }
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
