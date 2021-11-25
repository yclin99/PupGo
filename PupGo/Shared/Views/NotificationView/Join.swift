//
//  Join.swift
//  PupGo
//
//  Created by Yuchen Liu on 11/22/21.
//

import Foundation
import SwiftUI

struct Join: View {
    @State var joins = [Card](repeating: Card.join, count: 3)
    
    var body: some View{
        VStack{
            Text("Someone wants to Join your event!")
                .font(.system(size: 20))
                .fontWeight(.bold)
                .foregroundColor(.black)
                .opacity(joins.count > 0 ? 1 : 0)
            
            if joins.count > 0 {

                ZStack {
                    VStack {
                        ZStack {
                            ForEach(0..<joins.count, id: \.self){ index in
                                JoinRequestView(card: self.joins[index], onActivate: getApi)
                                    .stacked(at: index, in: self.joins.count)
                                
                                }
                            
                        Spacer(minLength: 1)
                            }
                        }
                    }
                }
                
            Spacer(minLength: 1)
        }
        .foregroundColor(.blue)
    }
    func getApi() {
        print("getApi called")
        if self.joins.count > 0 {
            joins.removeFirst(1)
        }
        
    }
}
