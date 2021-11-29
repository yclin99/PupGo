//
//  AppleLogin.swift
//  PupGo
//
//  Created by Hsin-Wei Yu on 11/21/21.
//

import SwiftUI
import CryptoKit
import AuthenticationServices
import Firebase

class AppleLoginViewModel: ObservableObject {
    @Published var nonce = ""
    func authenticate(credential: ASAuthorizationAppleIDCredential) {
        
        guard let token = credential.identityToken else {
            print("Error with Firebase")
            return
        }
        
        guard let tokenString = String(data: token, encoding: .utf8) else {
            print ("Error with token")
            return
        }
        
        let firebaseCredential = OAuthProvider.credential(withProviderID: "apple.com", idToken: tokenString, rawNonce: nonce)
        Auth.auth().signIn(with: firebaseCredential) { (result, err) in
            if let error = err {
                print (error.localizedDescription)
                return
            }
            
            print ("login successful")
        }
    }
}

func sha256(_ input: String) -> String {
  let inputData = Data(input.utf8)
  let hashedData = SHA256.hash(data: inputData)
  let hashString = hashedData.compactMap {
    String(format: "%02x", $0)
  }.joined()

  return hashString
}

    

func randomNonceString(length: Int = 32) -> String {
  precondition(length > 0)
  let charset: [Character] =
    Array("0123456789ABCDEFGHIJKLMNOPQRSTUVXYZabcdefghijklmnopqrstuvwxyz-._")
  var result = ""
  var remainingLength = length

  while remainingLength > 0 {
    let randoms: [UInt8] = (0 ..< 16).map { _ in
      var random: UInt8 = 0
      let errorCode = SecRandomCopyBytes(kSecRandomDefault, 1, &random)
      if errorCode != errSecSuccess {
        fatalError(
          "Unable to generate nonce. SecRandomCopyBytes failed with OSStatus \(errorCode)"
        )
      }
      return random
    }

    randoms.forEach { random in
      if remainingLength == 0 {
        return
      }

      if random < charset.count {
        result.append(charset[Int(random)])
        remainingLength -= 1
      }
    }
  }

  return result
}
