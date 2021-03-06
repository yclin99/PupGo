//
//  AppleLoginView.swift
//  PupGo
//
//  Created by Hsin-Wei Yu on 11/7/21.
//

import SwiftUI
import AuthenticationServices

struct AppleLoginView: View {
    @AppStorage("log_Status") var log_Status = false
    @StateObject var loginData = AppleLoginViewModel()
    var body: some View {
        SignInWithAppleButton { (request) in
            loginData.nonce =  randomNonceString()
            request.requestedScopes = [.email, .fullName]
            request.nonce = sha256(loginData.nonce)
            
        } onCompletion: { (result) in
            switch result {
            case .success(let user):
                print("success!")
                guard let credential = user.credential as? ASAuthorizationAppleIDCredential else {
                    print ("Error with Firebase")
                    return
                }
                loginData.authenticate(credential: credential )
                withAnimation {
                    log_Status = true
                    print("Token String: ")
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
        .signInWithAppleButtonStyle(.white)
        .frame(width: 45, height: 45)
        .opacity(0.02)
    }
}

struct AppleButtonView: View {
    var body: some View {
        Image("apple")
            .resizable()
            .frame(width: 40, height: 40)
    }
}

