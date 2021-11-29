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
    private let premission = ["email"]
    @AppStorage("log_Status") var log_Status = false
    
    var body: some View {
        //FBLogin().frame(width: 100, height: 50)
        Button(action: {handleLogin()}) {
            FBButton()
        }
    }
    
    func handleLogin() {
        let fbLoginManager = LoginManager()
        fbLoginManager.logIn(permissions: premission, from: UIHostingController(rootView: FBLoginView())) { (result, error) in
            if let error = error {
                print("Failed to login: \(error.localizedDescription)")
                let alertController = UIAlertController(title: "Login Error", message: error.localizedDescription, preferredStyle: .alert)
                let okayAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                alertController.addAction(okayAction)
                return
            }
            
            guard let _ = AccessToken.current else {
                print ("Failed to get access token")
                return
            }
            
            if result?.isCancelled == true {
                print("User canceled")
                return
            }
            
            let crediential = FacebookAuthProvider.credential(withAccessToken: AccessToken.current!.tokenString)
            
            Auth.auth().signIn(with: crediential, completion: { (user, error) in
                if let error = error {
                    print ("Login errro: \(error.localizedDescription)")
                    let alertController = UIAlertController(title: "Login Error", message: error.localizedDescription, preferredStyle: .alert)
                    let okayAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                    alertController.addAction(okayAction)
                    print ("asd")
                    return
                }
                withAnimation {
                    log_Status = true
                }
                return
                
            })
        }
    }
}

struct FBButton: View {
    var body: some View {
        Image("fb")
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: 45, height: 45)
    }
}


/*
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
*/

