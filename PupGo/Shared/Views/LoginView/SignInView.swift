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
            .onTapGesture {
                self.index = 0
            }
            .contentShape(CShape())
            .shadow(color: Color.black.opacity(0.3), radius: 5, x: 0, y: -5)
            .cornerRadius(35)
            .padding(.horizontal, 20)
            
            LoginButtonView(index: self.$index)
        }
        
    }
}

/*
struct SignInView_Previews: PreviewProvider {
    @State var user: String = ""
    @State var password: String = ""
    @State var index: Int = 0
    static var previews: some View {
        Text("Hey!")
        //SignInView(email: self.$user, pass: self.$password)
    }
}*/


struct LoginTextView: View {
    @Binding var index: Int
    var body: some View {
        HStack {
            VStack(spacing: 10) {
                Text("Login")
                    .foregroundColor(self.index == 0 ? .white : .brown)
                    .font(.title2)
                    .fontWeight(.bold)
                
                Capsule()
                    .fill(self.index == 0 ? .blue : Color.clear)
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
                    .foregroundColor(.yellow)
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
            }
            Divider().background(.white.opacity(0.5))
        }
        .padding(.horizontal)
        .padding(.top, 40)
    }
}

struct PasswordTextView: View {
    @Binding var pass: String
    @Binding var index: Int
    var body: some View {
        VStack {
            HStack(spacing: 15) {
                Image(systemName: "eye.slash.fill")
                    .foregroundColor(.yellow)
                SecureField("Password", text: self.$pass)
                    .onChange(of: pass) { newValue in
                        index = 5
                    }
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
    @Binding var index: Int
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
        .opacity(self.index == 0 ? 1 : 0)
    }
}
