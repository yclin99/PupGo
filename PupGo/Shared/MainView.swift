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
            CurvedTabView()
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
