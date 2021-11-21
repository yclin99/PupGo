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
    @Binding var index: Int
    @Binding var animationIndex: Int
    var body: some View {
        VStack {
            
            ZStack(alignment: .bottom) {
                VStack {
                    SignUpTextView(index: $index)
                        
                    EmailTextView(email: $email, index: $animationIndex)
                        
                    PasswordTextView(pass: $pass, index: $animationIndex)
                        // replace with re-enter password
                    ReEnterPasswordVieW(repass: $repass)
                }
                .padding()
                // bottom padding
                .padding(.bottom, 35)
                .background(.brown)
                .clipShape(ReCShape())
                // clipping the contecnt shape also for tap gesture
                .contentShape(ReCShape())
                .shadow(color: Color.black.opacity(0.3), radius: 5, x: 0, y: -5)
                .onTapGesture {
                    self.index = 1
                }
                .cornerRadius(35)
                .padding(.horizontal, 20)
                
                SignUpButtonView(index: $index)
            }
        }
    }
}

struct SignUpTextView: View {
    @Binding var index: Int
    var body: some View {
        HStack {
            Spacer(minLength: 0)
            VStack (spacing: 10) {
                Text("Sign Up")
                    .foregroundColor(self.index == 1 ? .white : .gray)
                    .font(.title2)
                    .fontWeight(.bold)
                Capsule()
                    .fill(self.index == 1 ? .blue : Color.clear)
                    .frame(width: 100, height: 5)
            }
            
        }
        .padding(.top, 30)
    }
}

struct SignUpView_Previews: PreviewProvider {
    @State var email: String = ""
    @State var pass: String = ""
    @State var index: Int = 0
    @State var repass: String = ""
    
    static var previews: some View {
        Text("hey!")
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
    @Binding var index: Int
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
        // hiding view when its in background
        .opacity(self.index == 1 ? 1 : 0)
    }
}

struct ReCShape: Shape {
    func path(in rect: CGRect) -> Path {
        return Path{path in
            
            path.move(to: CGPoint(x: rect.width, y: 0))
            path.addLine(to: CGPoint(x: rect.width, y: rect.height))
            path.addLine(to: CGPoint(x: 0, y: rect.height))
            path.addLine(to: CGPoint(x: 0, y: 100))
        }
    }
}
