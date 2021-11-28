//
//  NotificationView.swift
//  PupGo
//
//  Created by Hsin-Wei Yu on 11/5/21.
//

import Foundation
import SwiftUI

struct NotificationView: View {
    

    
    var body: some View {
        NavigationView {
            ZStack {
                lightYellowColor.ignoresSafeArea()
                VStack(alignment: .leading) {
                    Join()
                    UEvent()
                    FEvent()
                }

                .frame(width: UIScreen.main.bounds.width - 40, height: UIScreen.main.bounds.height - 200)
                .padding(.bottom,100)
            }
            
            

        }
    }
}

extension View {
    func stacked(at position: Int, in total: Int) -> some View {
        let offset = CGFloat(total - position)
        return self.offset(CGSize(width: 0, height: offset * 10))
    }
    
}
    


