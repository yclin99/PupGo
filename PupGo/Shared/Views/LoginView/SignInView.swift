//
//  SignUpView.swift
//  PupGo
//
//  Created by Hsin-Wei Yu on 11/15/21.
//

import SwiftUI

struct SignInView: View {
    @State var email: String = ""
    @State var pass: String = ""
    var body: some View {
        ZStack {
            lightYellowColor.edgesIgnoringSafeArea(.all)
            VStack {
                ImageText()
                SignIn(email: $email, pass: $pass)
            }
        }
    }
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
    }
}

struct SignIn: View {
    @Binding var email: String
    @Binding var pass: String
    var body: some View {
        
        ZStack(alignment: .bottom) {
            VStack {
                LoginTextView()
                
                EmailTextView(email: $email)
                
                PasswordTextView(pass: $pass)
                
                HStack {
                    Spacer(minLength: 0)
                    Button(action: {}) {
                        Text("Forget Password?")
                            .foregroundColor(.white.opacity(0.6))
                    }
                }
                .padding(.horizontal)
                .padding(.top, 30)
                
            }
            .padding()
            // bottom padding
            .padding(.bottom, 65)
            .background(.brown)
            .clipShape(CShape())
            .cornerRadius(35)
            .padding(.horizontal, 20)
            
            LoginButtonView()
        }
    }
}

struct LoginTextView: View {
    var body: some View {
        HStack {
            Text("Login")
                .foregroundColor(.white)
                .font(.title)
                .fontWeight(.bold)
            Spacer(minLength: 0)
        }
        .padding(.top, 40)
    }
}

struct EmailTextView: View {
    @Binding var email: String
    var body: some View {
        VStack {
            HStack(spacing: 15) {
                Image(systemName: "envelope.fill")
                    .foregroundColor(.yellow)
                TextField("Email Address", text: self.$email)
            }
            Divider().background(.white.opacity(0.5))
        }
        .padding(.horizontal)
        .padding(.top, 40)
    }
}

struct PasswordTextView: View {
    @Binding var pass: String
    var body: some View {
        VStack {
            HStack(spacing: 15) {
                Image(systemName: "eye.slash.fill")
                    .foregroundColor(.yellow)
                SecureField("Password", text: self.$pass)
            }
            Divider().background(.white.opacity(0.5))
        }
        .padding(.horizontal)
        .padding(.top, 30)
    }
}

struct CShape: Shape {
    func path(in rect: CGRect) -> Path {
        return Path{path in
            
            path.move(to: CGPoint(x: rect.width, y: 100))
            path.addLine(to: CGPoint(x: rect.width, y: rect.height))
            path.addLine(to: CGPoint(x: 0, y: rect.height))
            path.addLine(to: CGPoint(x: 0, y: 0))
        }
    }
}

struct LoginButtonView: View {
    var body: some View {
        // Button
        Button(action: {}) {
            Text("LOGIN")
                .foregroundColor(.white)
                .fontWeight(.bold)
                .padding(.vertical)
                .padding(.horizontal, 50)
                .background(.black)
                .clipShape(Capsule())
            // shadow
                .shadow(color: .white.opacity(0.1), radius: 5, x: 0, y: 5)
        }
        .offset(y: 25)
    }
}
