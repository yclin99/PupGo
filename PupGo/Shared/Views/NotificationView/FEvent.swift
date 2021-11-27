//
//  FEvent.swift
//  PupGo
//
//  Created by Yuchen Liu on 11/22/21.
//

import Foundation
import SwiftUI


struct FEvent: View {
    @State var fevents = Card.fevent
    
    var body: some View{
        if fevents.count > 0 {
            VStack{
                    

                    Text("You Are Invited")
                        .font(.system(size: 30))
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                        

                
                    ZStack {
                        VStack {
                             ZStack {
                                 ForEach(0..<fevents.count, id: \.self) { index in
                                    FriendsEventView(card: fevents[index], onActivate: getApi)
                                        .stacked(at: index, in: fevents.count)
                                }
                            }
                        }
                        
                    }
                    
                Spacer(minLength: 5)
            }
    }
    }
    
    func getApi() {
        print("getApi called")
        if self.fevents.count > 0 {
            fevents.removeLast(1)
        }
        
    }
}
