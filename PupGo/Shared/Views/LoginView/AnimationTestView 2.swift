//
//  AnimationTestView.swift
//  PupGo
//
//  Created by Hsin-Wei Yu on 11/18/21.
//

import SwiftUI

struct AnimationTestView: View {
    @State var username: String = ""
    @State var index: Int = 0
    var body: some View {
        ZStack {
            lightYellowColor.ignoresSafeArea(.all)
            VStack {
                ZStack {
                    Image("Login_0")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 100, height: 100)
                        .opacity(self.index == 0 ? 1 : 0)
                    Image("Login_1")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 100, height: 100)
                        .opacity(self.index == 1 ? 1 : 0)
                    Image("Login_2")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 100, height: 100)
                        .opacity(self.index == 2 ? 1 : 0)
                    Image("Login_3")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 100, height: 100)
                        .opacity(self.index == 3 ? 1 : 0)
                    Image("Login_4")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 100, height: 100)
                        .opacity(self.index == 4 ? 1 : 0)
                }
                
                TextView(username: $username, index: $index)
            }
            
        }
    }
}

struct AnimationTestView_Previews: PreviewProvider {
    static var previews: some View {
        AnimationTestView()
    }
}


struct TextView: View {
    @Binding var username: String
    @Binding var index: Int
    var body: some View {
        HStack {
            Spacer()
            TextField("Username", text: $username)
                .padding()
                .onChange(of: username) { newValue in
                    switch username.count {
                    case 2...6:
                        index = 1
                    case 7...11:
                        index = 2
                    case 12...15:
                        index = 3
                    case 16...25:
                        index = 4
                    default:
                        index = 0
                    }
                }
            Spacer()
        }
    }
    /*
    func changeOfText() -> View {
        print(self.username.count)
        return TestView(name: $username)
    }*/
}

struct TestView: View {
    @Binding var name: String
    var body: some View {
        Text(name)
    }
}
