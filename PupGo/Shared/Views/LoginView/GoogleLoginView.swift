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
            //GoogleButtonContent()
            GoogleButton()
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
                //let TingPO = authentication.accessTokenExpirationDate,
                //let Tingpo_2 = authentication.clientID,
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
                    //print ("idToken: ", idToken)
                }
            }
        }
    }
}

struct GoogleButtonContent: View {
    var body: some View {
        Text("\(Image("google")) Google Login")
            .font(.headline)
            .foregroundColor(.blue)
            .padding()
            .frame(width: 220, height: 60)
            .background(.white)
            .cornerRadius(35.0)
    }
}

struct GoogleButton: View {
    var body: some View {
        Image("google")
            .resizable()
            .frame(width: 45, height: 45)
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
            Button {
                GIDSignIn.sharedInstance.signOut()
                try? Auth.auth().signOut()
                withAnimation {
                    log_Status = false
                }
            } label: {
                Text("LOGOUT")
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                    .padding(.vertical)
                    .padding(.horizontal, 50)
                    .background(orangeColor)
                    .clipShape(Capsule())
                // shadow
                    .shadow(color: .white.opacity(0.1), radius: 5, x: 0, y: 5)
            }
            
            

        }
    }
}
