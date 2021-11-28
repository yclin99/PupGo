//
//  ContentView.swift
//  Shared
//
//  Created by Hsin-Wei Yu on 11/5/21.
//

import SwiftUI
public var myPID = "caefd1f0-a4fc-4ba3-81d8-1d0b0fbec730"

struct MainView: View {
    @AppStorage("log_Status") var log_Status = false
    var body: some View {
        
        if log_Status {
            CurvedTabView()
            // ApolloView()
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
