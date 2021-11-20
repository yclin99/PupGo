//
//  ManageDogProfileView.swift
//  PupGo
//
//  Created by ace_ye on 11/19/21.
//

import SwiftUI

struct ManageDogProfileView: View {
    var contentDogs : [DogProfile]
    
    var AddDogIcon: some View {
        HStack (alignment: .center){
            NavigationLink(destination: AddDogProfileView()) { Image(systemName: "plus.app").font(.system(size: 60)).foregroundColor(.black)
        }
        }
    }
    
    var body: some View {
//        NavigationView {
            ZStack {
                lightYellowColor
                VStack(alignment: .center, spacing: 50) {
                Text("My Dear Pups")
                    .font(.system(size: 35))
                    .bold().foregroundColor(.black)
                VStack (alignment: .center, spacing: 30) {
                    ForEach(contentDogs[0..<contentDogs.count], id: \.self, content: {dogview in DogView(content: dogview)})
                    AddDogIcon
                    }
                }
            }
            .edgesIgnoringSafeArea(.top)
//        }
    }
}

struct DogView: View {
    
    var content : DogProfile
    @State private var isPresented = false
    
    var body: some View {
        HStack (alignment: .center) {
            NavigationLink(destination: DogProfileView(content: content)) { content.image.resizable().frame(width: 300, height: 200)
                    .clipShape(Circle())
                                .shadow(radius: 10)
                                .overlay(Circle().stroke(Color.black, lineWidth: 5))
                
            }
        }
    }
}

