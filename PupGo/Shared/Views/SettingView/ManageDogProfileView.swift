//
//  ManageDogProfileView.swift
//  PupGo
//
//  Created by ace_ye on 11/19/21.
//

import SwiftUI

struct ManageDogProfileView: View {
    @ObservedObject var content : UserProfile
//    var contentDogs : [DogProfile]?
//    lazy var contentDogs = content.mydogs
    
    var AddDogIcon: some View {
        HStack (alignment: .center){
            NavigationLink(destination: AddDogProfileView(content: content)) { Image(systemName: "plus.app").font(.system(size: 60)).foregroundColor(.black)
        }
        }
    }
    
    var body: some View {
            ZStack {
                lightYellowColor
                VStack(alignment: .center, spacing: 50) {
                Text("My Dear Pups")
                    .font(.system(size: 35))
                    .bold().foregroundColor(.black)
                VStack (alignment: .center, spacing: 30) {
                    ForEach(content.mydogs![0..<content.mydogs!.count], id: \.self, content: {dogview in DogView(content: dogview)})
                    AddDogIcon
                    }
                }
            }
            .edgesIgnoringSafeArea(.top)
    }
}

struct DogView: View {
    
    var content : DogProfile
    @State private var isPresented = false
    
    var body: some View {
        HStack (alignment: .center) {
            NavigationLink(destination: DogProfileView(content: content)) { content.image.resizable().frame(width: 200, height: 150)
                    .clipShape(Circle())
                                .shadow(radius: 10)
                                .overlay(Circle().stroke(Color.black, lineWidth: 3))
                
            }
        }
    }
}

