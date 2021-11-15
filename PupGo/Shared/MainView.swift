//
//  ContentView.swift
//  Shared
//
//  Created by Hsin-Wei Yu on 11/5/21.
//

import SwiftUI

struct MainView: View {
    @AppStorage("log_Status") var log_Status = false
    var body: some View {
        
        if log_Status {
            NavigationView {
                TabView {
                    MatchView()
                        .tabItem {
                            Label("Match", systemImage: "house")
                        }
                    
                    EventExploreContentView()
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
        } else {
            LoginView()
        }
        
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
