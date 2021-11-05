//
//  BottomView.swift
//  PupGo_TextField
//
//  Created by wenye on 11/5/21.
//

import SwiftUI

struct BottomView: View {
    
    var swipe: some View {
        Button(action: {
          true
        }, label: {
          Image(systemName: "heart.circle.fill").font(.largeTitle)
                .foregroundColor(.yellow)
        })
            .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
    }
    
    var explore: some View {
        Button(action: {
          true
        }, label: {
          Image(systemName: "magnifyingglass.circle.fill").font(.largeTitle).foregroundColor(.yellow)
        })
            .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
    }
    
    var message: some View {
        Button(action: {
          true
        }, label: {
          Image(systemName: "message.circle.fill").font(.largeTitle)
                .foregroundColor(.yellow)
        })
            .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
    }
    
    var profile: some View {
        Button(action: {
          true
        }, label: {
            Image(systemName: "pawprint.circle.fill").font(.largeTitle).foregroundColor(.yellow)
        })
            .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
    }
    
    var body: some View {
        HStack(alignment: .center, spacing: 10) {
            swipe
            explore
            message
            profile
        }
    }
}

