//
//  EmailLoginView.swift
//  PupGo
//
//  Created by Hsin-Wei Yu on 11/7/21.
//

import SwiftUI

struct EmailLoginView: View {
    @Binding var username: String
    @Binding var password: String
    @AppStorage("log_Status") var log_Status = false
    var body: some View {
        VStack {
            LogoText()
            ImageText()
            UserNameText(username: $username)
            PasswordText(password: $password)
            Button (action: {print("Button tapped"); handleLogin()}) {
                LoginButtonContent()
            }
        }
    }
    func handleLogin() {
        if (username == "Evelynyu") && (password == "GreenField2@4") {
            log_Status = true
            print("Success!")
        }
    }
}

struct LogoText: View {
    var body: some View {
        Text("PupGo")
            .font(.largeTitle)
            .foregroundColor(.brown)
            .fontWeight(.semibold)
            .padding(.bottom, 20)
    }
}

struct ImageText: View {
    var body: some View {
        Image ("LoginPagePhoto")
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: 175, height: 175)
            .clipped()
            .cornerRadius(150)
                .overlay(RoundedRectangle(cornerRadius: 150)
                        .stroke(.yellow, lineWidth: 6))
            .padding(.bottom, 75)
    }
}

struct LoginButtonContent: View {
    var body: some View {
        Text("Login")
            .font(.headline)
            .foregroundColor(.white)
            .padding()
            .frame(width: 220, height: 60)
            .background(.black)
            .cornerRadius(35.0)
    }
}

struct UserNameText: View {
    @Binding var username: String
    var body: some View {
        TextField("Username", text: $username)
            .padding()
            .background(Color.brown)
            .cornerRadius(5.0)
            .padding(.bottom, 20)
    }
}

struct PasswordText: View {
    @Binding var password: String
    
    var body: some View {
        SecureField("Password", text: $password)
            .padding()
            .background(Color.brown)
            .cornerRadius(5.0)
            .padding(.bottom, 20)
    }
}
