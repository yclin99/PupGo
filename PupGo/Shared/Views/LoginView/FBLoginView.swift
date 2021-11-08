//
//  FBLoginView.swift
//  PupGo
//
//  Created by Hsin-Wei Yu on 11/7/21.
//

import SwiftUI
import Firebase
import FBSDKLoginKit

struct FBLoginView: View {
    var body: some View {
        FBLogin().frame(width: 100, height: 50)
    }
}

struct FBLogin: UIViewRepresentable {
    func makeCoordinator() -> FBLogin.Coordinator {
        return FBLogin.Coordinator()
    }
    
    func makeUIView(context: UIViewRepresentableContext<FBLogin>) -> FBLoginButton {
        let button = FBLoginButton()
        button.delegate = context.coordinator
        return button
    }
    
    func updateUIView(_ uiView: FBLoginButton, context: UIViewRepresentableContext<FBLogin>) {
        
    }
    
    class Coordinator: NSObject, LoginButtonDelegate {
        func loginButton(_ loginButton: FBLoginButton, didCompleteWith result: LoginManagerLoginResult?, error: Error?) {
            if error != nil {
                print ((error?.localizedDescription)!)
                return
            }
            if AccessToken.current != nil {
                let credential = FacebookAuthProvider.credential(withAccessToken: AccessToken.current!.tokenString)
                
                Auth.auth().signIn(with: credential) { (res, er) in
                    
                    if er != nil {
                        print((er?.localizedDescription))
                    }
                    
                    print("Success!")
                }
            }
        }
        
        func loginButtonDidLogOut(_ loginButton: FBLoginButton) {
            try! Auth.auth().signOut()
        }
    }
}

