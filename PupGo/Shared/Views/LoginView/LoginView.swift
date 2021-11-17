//
//  LoginView.swift
//  PupGo
//
//  Created by Hsin-Wei Yu on 11/5/21.
//

import SwiftUI

public var lightYellowColor = Color(#colorLiteral(red: 1, green: 1, blue: 0.88, alpha: 255))

struct LoginView: View {
    
    @State var email: String = "Evelynyu"
    @State var password: String = "GreenField2@4"
    @State var repass: String = ""
    @State var index: Int = 0
    
    var body: some View {
        ZStack {
            lightYellowColor.ignoresSafeArea()
            
            VStack {
                //EmailLoginView(username: $username, password: $password)
                Spacer()
                ImageText()
                ZStack {
                    SignUpView(index: $index)
                        .zIndex(Double(self.index))
                    SignInView(index: $index)
                }
                
                HStack (spacing: 15) {
                    Rectangle()
                        .fill(.gray)
                        .frame(height: 1)
                    Text("OR")
                    Rectangle()
                        .fill(.gray)
                        .frame(height: 1)
                }
                .padding(.horizontal, 20)
                .padding(.top, 50)
                
                HStack(spacing: 25) {
                    GoogleLoginView()
                        .frame(width: 50, height: 50)
                    FBLoginView()
                        .frame(width: 50, height: 50)
                }
                
            }
            .padding()
        }
    }
}
/**/
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
