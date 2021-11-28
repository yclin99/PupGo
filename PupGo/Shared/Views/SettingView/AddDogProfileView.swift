//
//  AddDogProfileView.swift
//  PupGo
//
//  Created by ace_ye on 11/19/21.
//

import SwiftUI

struct AddDogProfileView: View {
    
    @ObservedObject var content: UserProfile
    
    @State private var image: Image?
    @State private var showingImagePicker = false
    @State private var inputImage: UIImage?

    @State var petid: String = ""
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
                @ObservedObject var newdog = DogProfile()
                let uiImag = image!.asUIImage()
                let modifiedImage = uiImag.resize(150, 200)
                let final = Image(uiImage: modifiedImage!)
                newdog.manuaset(petname: petname, image: final)
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

extension View {
// This function changes our View to UIView, then calls another function
// to convert the newly-made UIView to a UIImage.
    public func asUIImage() -> UIImage {
        let controller = UIHostingController(rootView: self)
        
        controller.view.frame = CGRect(x: 0, y: CGFloat(Int.max), width: 1, height: 1)
        UIApplication.shared.windows.first!.rootViewController?.view.addSubview(controller.view)
        
        let size = controller.sizeThatFits(in: UIScreen.main.bounds.size)
        controller.view.bounds = CGRect(origin: .zero, size: size)
        controller.view.sizeToFit()
        
// here is the call to the function that converts UIView to UIImage: `.asUIImage()`
        let image = controller.view.asUIImage()
        controller.view.removeFromSuperview()
        return image
    }
}

extension UIView {
// This is the function to convert UIView to UIImage
    public func asUIImage() -> UIImage {
        let renderer = UIGraphicsImageRenderer(bounds: bounds)
        return renderer.image { rendererContext in
            layer.render(in: rendererContext.cgContext)
        }
    }
}

extension UIImage {
    func resize(_ width: CGFloat, _ height:CGFloat) -> UIImage? {
        let widthRatio  = width / size.width
        let heightRatio = height / size.height
        let ratio = widthRatio > heightRatio ? heightRatio : widthRatio
        let newSize = CGSize(width: size.width * ratio, height: size.height * ratio)
        let rect = CGRect(x: 0, y: 0, width: newSize.width, height: newSize.height)
        UIGraphicsBeginImageContextWithOptions(newSize, false, 1.0)
        self.draw(in: rect)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return newImage
    }
}
