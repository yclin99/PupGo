//
//  ContentView.swift
//  PupGo_TextField
//
//  Created by ace_ye on 10/29/21.
//

import SwiftUI

struct ContentView: View {
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
    
    var cancel: some View {
        Button(action: {
          username = username
        }, label: {
            Text("Cancel").font(.system(size: 18)).foregroundColor(.black)
                .background(RoundedRectangle(cornerRadius: 15)
                                        .fill(Color.white)
                                        .frame(width: 80, height: 40))
        })
            .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
    }
    
    var submit: some View {
        Button(action: {
          username = username
        }, label: {
            Text("Submit").font(.system(size: 18)).bold().foregroundColor(.white)
                .background(RoundedRectangle(cornerRadius: 12)
                                        .fill(Color.yellow)
                                        .frame(width: 80, height: 40))
        })
            .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
        
    }
    var body: some View {
        VStack(alignment: .center) {
            Spacer()
            HStack {
                cancel
                Spacer()
                submit
            }
            photoview
        HStack(alignment: .center) {
            Image(systemName: "pawprint.circle").font(.largeTitle)
            Text("Username:")
                .font(.callout)
                .bold()
            TextField("Enter username...", text: $username)
                .textFieldStyle(RoundedBorderTextFieldStyle())
        }.padding()
        HStack(alignment: .center) {
            Image(systemName: "clock").font(.largeTitle)
            Text("Start Time:")
                .font(.callout)
                .bold()
            TextField("DD/MM/YYYY HH:mm", text: $starttime)
                .textFieldStyle(RoundedBorderTextFieldStyle())
        }.padding()
        HStack(alignment: .center) {
            Image(systemName: "clock.fill").font(.largeTitle)
            Text("End Time:  ")
                .font(.callout)
                .bold()
            TextField("DD/MM/YYYY HH:mm", text: $endtime)
                .textFieldStyle(RoundedBorderTextFieldStyle())
        }.padding()
        HStack(alignment: .center) {
            Image(systemName: "location").font(.largeTitle)
            Text("Location:   ")
                .font(.callout)
                .bold()
            TextField("Walking dog at ...", text: $location)
                .textFieldStyle(RoundedBorderTextFieldStyle())
        }.padding()
            Spacer()
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
        ContentView()
    }
}
