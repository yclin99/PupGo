//
//  SettingView.swift
//  PupGo
//
//  Created by Hsin-Wei Yu on 11/5/21.
//
import Foundation
import SwiftUI

struct SettingView: View {
    static let OrangeColor = Color(red: 240.0 / 255, green: 165.0 / 255, blue: 25.0 / 255)
    static let gradientStart = Color(red: 239.0 / 255, green: 120.0 / 255, blue: 221.0 / 255)
    static let gradientEnd = Color(red: 239.0 / 255, green: 172.0 / 255, blue: 120.0 / 255)
    
    @ObservedObject var userprofile = UserProfile(userid: 1, username: "This owner")
    @ObservedObject var dog1 = DogProfile(petid: 1001, petname: "UglyDog", image: Image("Dog1"))
    @ObservedObject var dog2 = DogProfile(petid: 1003, petname: "Goofy", image: Image("Dog3"))
    
    init(){
        userprofile.createPet(newdog: dog1)
        userprofile.createPet(newdog: dog2)
    }

    var userView : some View {
        NavigationLink(destination: UserProfileView(content: userprofile)) {
            ZStack(){
                Rectangle()
                    .fill(.linearGradient(
                        Gradient(colors: [Self.OrangeColor, Self.gradientStart]),
                        startPoint: UnitPoint(x: 0.5, y: 0),
                        endPoint: UnitPoint(x: 0.0, y: 1.0)
                    ))
                .frame(width: 300, height: 150)
                HStack(alignment: .center){
                    Image(systemName: "person.crop.circle").font(.largeTitle).foregroundColor(.black)
                    Text("View User Profile")
                .font(.system(size: 25))
                .bold().foregroundColor(.black)
                }
            }
        }
    }
    
    var dogView : some View {
        NavigationLink(destination: ManageDogProfileView(content: userprofile)) {
            ZStack(){
                Rectangle()
                    .fill(.linearGradient(
                        Gradient(colors: [Self.OrangeColor, Self.gradientStart]),
                        startPoint: UnitPoint(x: 0.5, y: 0),
                        endPoint: UnitPoint(x: 0.0, y: 1.0)
                    ))
                .frame(width: 300, height: 150)
                HStack(alignment: .center){
                    Image(systemName: "pawprint.circle").font(.largeTitle).foregroundColor(.black)
                    Text("View Dog Profile")
                        .font(.system(size: 25))
                        .bold().foregroundColor(.black)
                }
            }
        }
    }

    var notificationSetting : some View {
        NavigationLink(destination: UserProfileView(content: userprofile)) {
            HStack(alignment: .center) {Image(systemName: "message.and.waveform.fill").font(.largeTitle).foregroundColor(.black)
            Text("Set Notification")
                .font(.system(size: 25))
                .bold().foregroundColor(.black)
            }
        }
    }
    
    var body: some View {
        NavigationView {
            ZStack {
                lightYellowColor
                VStack(alignment: .center, spacing: 50) {
                Text("Settings")
                    .font(.system(size: 35))
                    .bold().foregroundColor(.black)
                VStack (alignment: .leading, spacing: 80) {
                    userView
                    dogView
                    GoogleLogOutButton()
                }
            }
            }
            .edgesIgnoringSafeArea(.top)
        }
    }
}




struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        SettingView()
    }
}


