//
//  EditDogProfileView.swift
//  PupGo
//
//  Created by ace_ye on 11/16/21.
//

import SwiftUI

struct EditDogProfileView: View {
    @State var content : DogProfile
    
    @State private var image: Image?
    @State private var showingImagePicker = false
    @State private var inputImage: UIImage?
    
    @State private var showingAlert = false
    
    var SaveProfile: some View {
        Button(action: {showingAlert = true}, label: {
            Text("Save").font(.system(size: 20)).bold().foregroundColor(.white)
                .background(RoundedRectangle(cornerRadius: 1).fill(Color.yellow).frame(width: 120, height: 40))
        }).alert(isPresented:$showingAlert) {
            Alert(
                title: Text("Changes Saved")
            )}
    }
    
    var photoview: some View {
        NavigationView {
            content.image!.resizable().scaledToFit().frame(width: 250, height: 250)
                .onTapGesture {
                    self.showingImagePicker = true
                }
        }
    }
    
    
    var body: some View {
        ZStack {
            lightYellowColor
                 .edgesIgnoringSafeArea(.all)
            VStack (alignment: .center) {
                content.image!.resizable().scaledToFit().frame(width: 180, height: 180)
            List {
                HStack(alignment: .center) {
                    Text("Pet ID: ")
                        .bold()
                    Text(String(content.petid))}
                HStack(alignment: .center) {
                    Text("Pet Name: ")
                        .bold()
                    Text(content.petname)}
                HStack(alignment: .center) {
                    Text("isCastrated: ")
                        .bold()
                    if content.isCastration  {
                        Text("Yes")}
                    else {
                        Text("No")}
                }
                HStack(alignment: .center) {
                    Text("Pet Breed is: ")
                        .bold()
                    TextField("Edit Breed...", text: $content.breed.bound)}
                HStack(alignment: .center) {
                    Text("Pet Gender is: ")
                        .bold()
                    TextField("MALE/FEMALE", text: $content.gender.bound)}
                HStack(alignment: .center) {
                    Text("Pet Birthday is: ")
                        .bold()
                    TextField("DD/MM/YYYY HH:mm", text: $content.birthday.bound)}
                HStack(alignment: .center) {
                    Text("Pet Location is: ")
                        .bold()
                    TextField("No 111 Earth...", text: $content.location.bound)}
                }.listStyle(PlainListStyle())
                .font(.callout)
                .environment(\.defaultMinListRowHeight, 45)
                Spacer(minLength: 30)
                SaveProfile
                Spacer(minLength: 80)
            }
        }
        .navigationTitle("image")
        .sheet(isPresented: $showingImagePicker, onDismiss: loadImage) {
            ImagePicker(image: self.$inputImage)}
    }
    func loadImage() {
        guard let inputImage = inputImage else { return }
        image = Image(uiImage: inputImage)
    }

}

