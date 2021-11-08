//
//  LoginView.swift
//  PupGo
//
//  Created by Hsin-Wei Yu on 11/5/21.
//

import Foundation
import SwiftUI



let lightYellowColor = Color(#colorLiteral(red: 1, green: 1, blue: 0.88, alpha: 255))

struct LoginView: View {
    
    @State var username: String = ""
    @State var password: String = ""
    
    var body: some View {
        ZStack {
            lightYellowColor.ignoresSafeArea()
            
            VStack {
                EmailLoginView(username: $username, password: $password)
                
                Divider()
                
                GoogleLoginView()
            }
            .padding()
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
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
