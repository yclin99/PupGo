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
    @Binding var index: Int
    @Binding var animationIndex: Int
    var body: some View {

        ZStack(alignment: .bottom) {
            VStack {
                LoginTextView(index: self.$index)
                
                EmailTextView(email: $email, index: self.$animationIndex)
                
                PasswordTextView(pass: $pass, index: self.$animationIndex)
                
                ForgetPasswordButton()
            }
            .padding()
            // bottom padding
            .padding(.bottom, 35)
            .background(.brown)
            .clipShape(CShape())
            .onTapGesture {
                self.index = 0
            }
            .contentShape(CShape())
            .shadow(color: Color.black.opacity(0.3), radius: 5, x: 0, y: -5)
            .cornerRadius(35)
            .padding(.horizontal, 20)
            
            LoginButtonView(index: self.$index, email: $email, pass: $pass)
        }
    }
}

struct LoginTextView: View {
    @Binding var index: Int
    var body: some View {
        HStack {
            VStack(spacing: 10) {
                Text("Login")
                    .foregroundColor(self.index == 0 ? .white : lightBrownColor)
                    .font(.title2)
                    .fontWeight(.bold)
                
                Capsule()
                    .fill(self.index == 0 ? deepBrownColor : Color.clear)
                    .frame(width: 100, height: 5)
            }
            
            Spacer(minLength: 0)
        }
        .padding(.top, 30)
    }
}

struct EmailTextView: View {
    @Binding var email: String
    @Binding var index: Int
    var body: some View {
        VStack {
            HStack(spacing: 15) {
                Image(systemName: "envelope.fill")
                    .foregroundColor(brownColor)
                TextField("Email Address", text: self.$email)
                    .onChange(of: email) { newValue in
                        switch email.count {
                        case 3...6:
                            index = 1
                        case 7...10:
                            index = 2
                        case 11...14:
                            index = 3
                        case 15...25:
                            index = 4
                        default:
                            index = 0
                        }
                    }
                    .textInputAutocapitalization(.never)
            }
            Divider().background(.white.opacity(0.5))
        }
        .padding(.horizontal)
        .padding(.top, 20)
    }
}

struct PasswordTextView: View {
    @Binding var pass: String
    @Binding var index: Int
    @State private var isSecured: Bool = true
    var body: some View {
        VStack {
            //ZStack {
                HStack(spacing: 15) {
                    Button(action: {
                        if isSecured {
                            index = 6
                        } else {
                            index = 5
                        }
                        isSecured.toggle()
                    }) {
                        Image(systemName: self.isSecured ? "eye.slash.fill" : "eye.fill")
                            .foregroundColor(brownColor)
                    }
                    if isSecured {
                        SecureField("Password", text: self.$pass)
                            .onChange(of: pass) { newValue in
                                index = 5
                            }
                            .padding(.top, 0.5)
                            .textInputAutocapitalization(.never)
                    } else {
                        TextField("Password", text: self.$pass)
                            .textInputAutocapitalization(.never)
                    }
                }
            //}
            
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
    @Binding var index: Int
    @Binding var email: String
    @Binding var pass: String
    @AppStorage("log_Status") var log_Status = false
    var body: some View {
        // Button
        Button(action: {
            if self.email == testEmail && self.pass == testPassword {
                withAnimation {
                    log_Status = true
                }
            }
        }) {
            Text("LOGIN")
                .foregroundColor(.white)
                .fontWeight(.bold)
                .padding(.vertical)
                .padding(.horizontal, 50)
                .background(orangeColor)
                .clipShape(Capsule())
            // shadow
                .shadow(color: .white.opacity(0.1), radius: 5, x: 0, y: 5)
        }
        .offset(y: 25)
        .opacity(self.index == 0 ? 1 : 0)
    }
}

struct ForgetPasswordButton: View {
    var body: some View {
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
}
