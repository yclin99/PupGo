//
//  AddDogProfileView.swift
//  PupGo
//
//  Created by ace_ye on 11/19/21.
//

import SwiftUI

struct AddDogProfileView: View {
    
    @State var content: UserProfile
    
    @State private var image: Image?
    @State private var showingImagePicker = false
    @State private var inputImage: UIImage?

    @State var petid: Int = 103
    @State var petname: String = ""
    @State var gender: String?
    @State var breed: String?
    @State var isCastration: String = ""
    @State var birthday: String?
    @State var location: String?
    
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
    
//    var submit: some View {
//        Button(action: {showingAlert = true}, label: {
//            Text("Submit").font(.system(size: 20)).bold().foregroundColor(.white)
//                .background(RoundedRectangle(cornerRadius: 1).fill(Color.yellow).frame(width: 160, height: 50))
//        }).alert(isPresented:$showingAlert) {
//            Alert(
//                title: Text("You have registered a new Pup!")
//                )
//            }
//    }
    
    var submit: some View {
        Button(action: {
            showingAlert = true
            if image != nil {
                var newdog = DogProfile(petid: petid, petname: petname, image: image!)
                content.createPet(newdog: newdog)
                 
            }
        }, label: {
            Text("Submit").font(.system(size: 20)).bold().foregroundColor(.white)
                .background(RoundedRectangle(cornerRadius: 1).fill(Color.yellow).frame(width: 160, height: 40))
        })
    }
    
//    var back: some View {
//        NavigationLink(destination: SettingView()) {
//            Text("Back to Setting").font(.system(size: 20)).bold().foregroundColor(.white)
//                .background(RoundedRectangle(cornerRadius: 1).fill(Color.yellow).frame(width: 160, height: 40))
//        }
//    }
    
    var body: some View {
        ZStack {
            Color(#colorLiteral(red: 1, green: 1, blue: 0.88, alpha: 255)).edgesIgnoringSafeArea(.all)
        VStack(alignment: .center) {
            Spacer()
        photoview
            List {
                HStack(alignment: .center) {
                    Text("Pet Name: ")
                        .bold()
                    TextField("Enter Name...", text: $petname)}
                HStack(alignment: .center) {
                    Text("isCastrated: ")
                        .bold()
                    TextField("Yes/No", text: $isCastration)}
                HStack(alignment: .center) {
                    Text("Pet Breed is: ")
                        .bold()
                    TextField("Edit Breed...", text: $breed.bound)}
                HStack(alignment: .center) {
                    Text("Pet Gender is: ")
                        .bold()
                    TextField("He/She", text: $gender.bound)}
                HStack(alignment: .center) {
                    Text("Pet Birthday is: ")
                        .bold()
                    TextField("DD/MM/YYYY HH:mm", text: $birthday.bound)}
                HStack(alignment: .center) {
                    Text("Pet Location is: ")
                        .bold()
                    TextField("No 111 Earth...", text: $location.bound)}
                }.listStyle(PlainListStyle())
                .font(.callout)
                .environment(\.defaultMinListRowHeight, 50)
            Spacer(minLength: 30)
        HStack {
            submit
//            back
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

//struct AddDogProfileView_Previews: PreviewProvider {
//    static var previews: some View {
//        AddDogProfileView()
//    }
//}

