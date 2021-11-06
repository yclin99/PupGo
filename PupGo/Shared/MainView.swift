//
//  ContentView.swift
//  Shared
//
//  Created by Hsin-Wei Yu on 11/5/21.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        TabView {
            MatchView()
                .tabItem {
                    Label("Match", systemImage: "house")
                }
            
            ExploreView()
                .tabItem {
                    Image(systemName: "map")
                    Text("Explore")
                }
            
            NotifyView()
                .tabItem {
                    Image(systemName: "message")
                    Text("Notification")
                }
            
            SettingView()
                .tabItem {
                    Image(systemName: "gear")
                    Text("Setting")
                }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
