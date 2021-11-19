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
    @State var animationIndex: Int = 0
    
    var body: some View {
        ZStack {
            lightYellowColor.ignoresSafeArea()
            
            VStack {
                //EmailLoginView(username: $username, password: $password)
                Spacer()
                AnimationView(index: $animationIndex)
                    
                ZStack {
                    SignUpView(index: $index, animationIndex: $animationIndex)
                        .zIndex(Double(self.index))
                    SignInView(index: $index, animationIndex: $animationIndex)
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

struct AnimationView: View {
    @Binding var index: Int
    var body: some View {
        VStack {
            ZStack {
                Image("Login_0")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 150, height: 150)
                    .opacity(self.index == 0 ? 1 : 0)
                Image("Login_1")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 150, height: 150)
                    .opacity(self.index == 1 ? 1 : 0)
                Image("Login_2")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 150, height: 150)
                    .opacity(self.index == 2 ? 1 : 0)
                Image("Login_3")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 150, height: 150)
                    .opacity(self.index == 3 ? 1 : 0)
                Image("Login_4")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 150, height: 150)
                    .opacity(self.index == 4 ? 1 : 0)
                Image("shy")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 150, height: 150)
                    .opacity(self.index == 5 ? 1 : 0)
            }
            Capsule()
                .fill(.brown)
                .frame(width: 200, height: 10)
                .padding(.vertical, -10)
        }
    }
}
