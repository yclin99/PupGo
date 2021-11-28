//
//  ContentView.swift
//  PupGo_TextField
//
//  Created by wenye on 10/29/21.
//

import SwiftUI

struct CreateEventContentView: View {
    
    @State private var image: Image?
    @State private var showingImagePicker = false
    @State private var inputImage: UIImage?

    
    @State var username: String = ""
    @State var starttime : String = ""
    @State var endtime : String = ""
    @State var location: String = ""
    @State var limitOfDogs: Int = 5
    @State var limitOfHumans: Int = 4
    var photoview: some View {
        NavigationView {
            ZStack{
                Color(#colorLiteral(red: 1, green: 1, blue: 0.88, alpha: 255)).edgesIgnoringSafeArea(.all)
                ZStack {
                    Rectangle()
                        .fill(Color.secondary)
                    .frame(width: 200, height: 200)
                    if image != nil {
                        image?.resizable().scaledToFit()
                    } else {
                        Text("Upload a photo here").foregroundColor(.white)
                    }
                }
                .onTapGesture {
                    self.showingImagePicker = true
                }
            }
        }
    }
    
    @State private var showingAlert = false
    
    var submit: some View {
        Button(action: {showingAlert = true}, label: {
            Text("Submit").font(.system(size: 18)).bold().foregroundColor(.white)
                .background(RoundedRectangle(cornerRadius: 1).fill(Color.yellow).frame(width: 160, height: 50))
        }).alert(isPresented:$showingAlert) {
            Alert(
                title: Text("Successfully Created")
                )
            }
    }
    
    var body: some View {
        ZStack {
            Color(#colorLiteral(red: 1, green: 1, blue: 0.88, alpha: 255)).edgesIgnoringSafeArea(.all)
        VStack(alignment: .center) {
            Spacer()
        photoview
        VStack {
        HStack(alignment: .center) {
            Image(systemName: "pawprint.circle").font(.largeTitle)
            Text("Username:")
                .font(.callout)
                .bold()
            TextField("Enter username...", text: $username)
                .textFieldStyle(RoundedBorderTextFieldStyle()).foregroundColor(.white)
        }.padding()
        HStack(alignment: .center) {
            Image(systemName: "clock").font(.largeTitle)
            Text("Start Time:")
                .font(.callout)
                .bold()
            TextField("DD/MM/YYYY HH:mm", text: $starttime)
                .textFieldStyle(RoundedBorderTextFieldStyle()).foregroundColor(.white)
        }.padding()
        HStack(alignment: .center) {
            Image(systemName: "clock.fill").font(.largeTitle)
            Text("End Time:  ")
                .font(.callout)
                .bold()
            TextField("DD/MM/YYYY HH:mm", text: $endtime)
                .textFieldStyle(RoundedBorderTextFieldStyle()).foregroundColor(.white)
        }.padding()
        HStack(alignment: .center) {
            Image(systemName: "location").font(.largeTitle)
            Text("Location:   ")
                .font(.callout)
                .bold()
            TextField("Walking dog at ...", text: $location)
                .textFieldStyle(RoundedBorderTextFieldStyle()).foregroundColor(.white)
        }.padding()
        }
        HStack {
            Spacer()
            submit
            Spacer()
        }
        Spacer(minLength: 80)
    }
        }
        .navigationTitle("image")
        .sheet(isPresented: $showingImagePicker, onDismiss: loadImage) {
            ImagePicker(image: self.$inputImage)
        }
    }
    
    func loadImage() {
        guard let inputImage = inputImage else { return }
        image = Image(uiImage: inputImage)
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        CreateEventContentView()
    }
}
