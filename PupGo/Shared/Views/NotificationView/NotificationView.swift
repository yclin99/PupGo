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
                    Spacer()
                    Join()
                    UEvent()
                    FEvent()
                }
                .frame(width: UIScreen.main.bounds.width - 40, height: UIScreen.main.bounds.height - 240)
                .padding(.bottom, 200)
                Spacer()
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
    


struct NotificationView_Previews: PreviewProvider {
    static var previews: some View {
        NotificationView()
    }
}
