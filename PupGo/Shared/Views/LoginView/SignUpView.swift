//
//  SignUpView.swift
//  PupGo
//
//  Created by Hsin-Wei Yu on 11/15/21.
//

import SwiftUI


struct SignUpView: View {
    @State var email: String = ""
    @State var pass: String = ""
    @State var repass: String = ""
    var body: some View {
        ZStack {
            lightYellowColor.edgesIgnoringSafeArea(.all)
            VStack {
                ImageText()
                SignUp(email: $email, pass: $pass, repass: $repass)
            }
        }
    }
}

struct SignUp: View {
    @Binding var email: String
    @Binding var pass: String
    @Binding var repass: String
    var body: some View {
        
        ZStack(alignment: .bottom) {
            VStack {
                SignUpTextView()
                
                EmailTextView(email: $email)
                
                PasswordTextView(pass: $pass)
                // replace with re-enter password
                ReEnterPasswordVieW(repass: $repass)
            }
            .padding()
            // bottom padding
            .padding(.bottom, 65)
            .background(.brown)
            .clipShape(PShape())
            .cornerRadius(35)
            .padding(.horizontal, 20)
            
            SignUpButtonView()
        }
    }
}

struct SignUpTextView: View {
    var body: some View {
        HStack {
            Spacer(minLength: 0)
            Text("Sign Up")
                .foregroundColor(.white)
                .font(.title)
                .fontWeight(.bold)
        }
        .padding(.top, 40)
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}

struct ReEnterPasswordVieW: View {
    @Binding var repass: String
    var body: some View {
        VStack {
            HStack(spacing: 15) {
                Image(systemName: "eye.slash.fill")
                    .foregroundColor(.yellow)
                SecureField("Password", text: self.$repass)
            }
            Divider().background(.white.opacity(0.5))
        }
        .padding(.horizontal)
        .padding(.top, 30)
    }
}

struct SignUpButtonView: View {
    var body: some View {
        // Button
        Button(action: {}) {
            Text("SIGNUP")
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

struct PShape: Shape {
    func path(in rect: CGRect) -> Path {
        return Path{path in
            
            path.move(to: CGPoint(x: rect.width, y: 0))
            path.addLine(to: CGPoint(x: rect.width, y: rect.height))
            path.addLine(to: CGPoint(x: 0, y: rect.height))
            path.addLine(to: CGPoint(x: 0, y: 100))
        }
    }
}
