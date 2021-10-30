//
//  ContentView.swift
//  PupGo_TextField
//
//  Created by ace_ye on 10/29/21.
//

import SwiftUI

struct ContentView: View {
//    @State private var showingImagePicker = false
//    @State private var inputImage: UIImage?
//    func loadImage() {
//        guard let inputImage = inputImage else { return }
//        image = Image(uiImage: inputImage)
//    }
//
    
    @State var username: String = ""
    @State var starttime : String = ""
    @State var endtime : String = ""
    @State var location: String = ""
    @State var limitOfDogs: Int = 5
    @State var limitOfHumans: Int = 4
    var photoview: some View {
        RoundedRectangle(cornerRadius: 25)
        .stroke(Color.yellow, lineWidth: 2)
        .frame(width: 200, height: 200)
        .overlay(
            Text("Upload a photo here")
        )
    }
    
    var cancel: some View {
        Button(action: {
          username = username
        }, label: {
            Text("Cancel").font(.system(size: 25)).bold().foregroundColor(.white)
                .background(RoundedRectangle(cornerRadius: 15)
                                        .fill(Color.yellow)
                                        .frame(width: 100, height: 60))
        })
    }
    
    var submit: some View {
        Button(action: {
          username = username
        }, label: {
            Text("Submit").font(.system(size: 25)).bold().foregroundColor(.white)
                .background(RoundedRectangle(cornerRadius: 15)
                                        .fill(Color.yellow)
                                        .frame(width: 100, height: 60))
        })
        
    }
    var body: some View {
        VStack(alignment: .center) {
            Spacer()
            photoview.padding()
        HStack(alignment: .center) {
            Text("Username:")
                .font(.callout)
                .bold()
            TextField("Enter username...", text: $username)
                .textFieldStyle(RoundedBorderTextFieldStyle())
        }.padding()
        HStack(alignment: .center) {
            Text("Start Time:")
                .font(.callout)
                .bold()
            TextField("DD/MM/YYYY HH:mm", text: $starttime)
                .textFieldStyle(RoundedBorderTextFieldStyle())
        }.padding()
        HStack(alignment: .center) {
            Text("End Time:  ")
                .font(.callout)
                .bold()
            TextField("DD/MM/YYYY HH:mm", text: $endtime)
                .textFieldStyle(RoundedBorderTextFieldStyle())
        }.padding()
        HStack(alignment: .center) {
            Text("Location:    ")
                .font(.callout)
                .bold()
            TextField("Walking dog at ...", text: $location)
                .textFieldStyle(RoundedBorderTextFieldStyle())
        }.padding()
            Spacer()
        HStack {
            Spacer(minLength: 2)
            cancel
            Spacer()
            submit
            Spacer(minLength: 2)
        }
    }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
