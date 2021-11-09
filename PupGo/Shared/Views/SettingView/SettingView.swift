//
//  SettingView.swift
//  PupGo
//
//  Created by Hsin-Wei Yu on 11/5/21.
//
import Foundation
import SwiftUI

struct SettingView: View {
    var body: some View {
        NavigationView {
            ZStack {
                Color.yellow
                VStack {
                    GoogleLogOutButton()
                }
            }
            .edgesIgnoringSafeArea(.top)
            .navigationTitle("Setting")
        }
    }
}
