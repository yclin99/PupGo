//
//  Join.swift
//  PupGo
//
//  Created by Yuchen Liu on 11/22/21.
//

import Foundation
import SwiftUI

struct Join: View {
    @State var joins = Card.join
    
    var body: some View{
        VStack{
            
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
                
            Spacer(minLength: 5)
        }
        .foregroundColor(.blue)
    }
    func getApi() {
        print("getApi called")
        if self.joins.count > 0 {
            joins.removeLast(1)
        }
        
    }
}
