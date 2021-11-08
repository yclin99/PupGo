//
//  GoogleLoginView.swift
//  PupGo
//
//  Created by Hsin-Wei Yu on 11/7/21.
//

import SwiftUI
import Firebase
import GoogleSignIn

struct GoogleLoginView: View {
    @State var isLoading: Bool = false
    @AppStorage("log_Status") var log_Status = false
    
    var body: some View {
        Button(action: {handleLogin()}) {
            GoogleButtonContent()
        }
    }
    
    func handleLogin() {
        guard let clientID = FirebaseApp.app()?.options.clientID else { return }

        // Create Google Sign In configuration object.
        let config = GIDConfiguration(clientID: clientID)
        
        isLoading = true
        
        GIDSignIn.sharedInstance.signIn(with: config, presenting: getRootViewController()) {[self] user, err in
            
            if let error = err {
                isLoading = false
                print(error.localizedDescription)
              return
            }

            guard
              let authentication = user?.authentication,
              let idToken = authentication.idToken
            else {
                isLoading = false
              return
            }

            let credential = GoogleAuthProvider.credential(withIDToken: idToken,
                                                           accessToken: authentication.accessToken)
            
            Auth.auth().signIn(with: credential) { result, err in
                isLoading = false
                if let error = err {
                    print(error.localizedDescription)
                  return
                }
                guard let user = result?.user else{
                    return
                }
                
                print(user.displayName ?? "Success!")
                
                withAnimation {
                    log_Status = true
                }
            }
        }
    }
}

struct GoogleButtonContent: View {
    var body: some View {
        Text("\(Image(systemName: "g.circle")) Google Login")
            .font(.headline)
            .foregroundColor(.blue)
            .padding()
            .frame(width: 220, height: 60)
            .background(.white)
            .cornerRadius(35.0)
    }
}

struct IsLoadingView: View {
    @Binding var isLoading: Bool
    var body: some View {
        ZStack {
            if isLoading {
                Color.black
                    .opacity(0.25)
                    .ignoresSafeArea()
                
                ProgressView()
                    .font(.title2)
                    .frame(width: 60, height: 60)
                    .background(Color.white)
                    .cornerRadius(10)
            }
        }
    }
}

struct GoogleLogOutButton: View {
    @AppStorage("log_Status") var log_Status = false
    var body: some View {
        VStack {
            Button("Logout") {
                GIDSignIn.sharedInstance.signOut()
                try? Auth.auth().signOut()
                
                withAnimation {
                    log_Status = false
                }
            }
        }
    }
}
