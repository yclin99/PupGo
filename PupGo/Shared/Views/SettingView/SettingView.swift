//
//  SettingView.swift
//  PupGo
//
//  Created by Hsin-Wei Yu on 11/5/21.
//
import Foundation
import SwiftUI

struct SettingView: View {
    
    var userprofile = UserProfile(userid: 1, username: "This owner")
    var dogprofile = DogProfile(petid: 1001, petname: "UglyDog", image: Image("Dog1"))
    
    var userView : some View {
        NavigationLink(destination: UserProfileView(content: userprofile)) {
            HStack(alignment: .center) {Image(systemName: "person.crop.circle").font(.largeTitle).foregroundColor(.black)
            Text("View User Profile")
                .font(.system(size: 25))
                .bold().foregroundColor(.black)
            }
        }
    }
    
    var dogView : some View {
        NavigationLink(destination: DogProfileView(content: dogprofile)) {
            HStack(alignment: .center) {Image(systemName: "pawprint.circle").font(.largeTitle).foregroundColor(.black)
            Text("View Dog Profile")
                .font(.system(size: 25))
                .bold().foregroundColor(.black)
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
                    notificationSetting
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
