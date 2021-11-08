//
//  LoginView.swift
//  PupGo
//
//  Created by Hsin-Wei Yu on 11/5/21.
//

import Foundation
import SwiftUI
import Firebase
import GoogleSignIn

let lightYellowColor = Color(#colorLiteral(red: 1, green: 1, blue: 0.88, alpha: 255))

struct LoginView: View {
    
    @State var username: String = ""
    @State var password: String = ""
    
    var body: some View {
        ZStack {
            lightYellowColor.ignoresSafeArea()
            
            VStack {
                LogoText()
                ImageText()
                UserNameText(username: $username)
                PasswordText(password: $password)
                
                Button (action: {handleLogin()}) {
                    LoginButtonContent()
                }
                //Spacer()
                Divider()
            }
            .padding()
        }
    }
    
    func handleLogin() {
        guard let clientID = FirebaseApp.app()?.options.clientID else { return }

        // Create Google Sign In configuration object.
        let config = GIDConfiguration(clientID: clientID)
        
        GIDSignIn.sharedInstance.signIn(with: config, presenting: getRootViewController()) {[self] user, err in
            
            if let error = err {
                print(error.localizedDescription)
              return
            }

            guard
              let authentication = user?.authentication,
              let idToken = authentication.idToken
            else {
              return
            }

            let credential = GoogleAuthProvider.credential(withIDToken: idToken,
                                                           accessToken: authentication.accessToken)
            
            Auth.auth().signIn(with: credential) { result, err in
                if let error = err {
                    print(error.localizedDescription)
                  return
                }
                guard let user = result?.user else{
                    return
                }
                
                print(user.displayName ?? "Success!")
            }
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
                        .stroke(Color.yellow, lineWidth: 6))
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

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
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

extension View {
    func getRootViewController()->UIViewController{
        guard let screen = UIApplication.shared.connectedScenes.first as? UIWindowScene else {
            return .init()
        }
        
        guard let root = screen.windows.first?.rootViewController else {
            return .init()
        }
        return root
    }
}
