//
//  MyNotificationView.swift
//  PupGo
//
//  Created by Hsin-Wei Yu on 11/28/21.
//

import SwiftUI

struct MyNotificationView: View {
    
    @State var offset: CGPoint = .zero
    
    @StateObject var notificationObserver = NotificationObserver()
    
    var body: some View {
        NavigationView {
            
            ZStack {
                lightYellowColor.ignoresSafeArea()
                ScrollView(.vertical, showsIndicators: false, content: {
                    VStack(alignment: .leading, spacing: 15) {
                        
                        if notificationObserver.notifications.isEmpty {
                            ProgressView()
                        }
                        else if notificationObserver.notifications.count == 1 {
                            ProgressView()
                                .onAppear {
                                    print("Waiting for new notifications")
                                    //self.obser.getNewUsers()
                                }
                        } else {

                            ForEach(self.notificationObserver.notifications) {i in
                                Group {
                                    NotificationCardView(id: i.id, name: i.petName, image: i.image)
                                        .environmentObject(notificationObserver)
                                }
                            }
                        }
                    }
                    .padding(.top)
                })
            }
        }
    }
}

struct MyNotificationView_Previews: PreviewProvider {
    static var previews: some View {
        MyNotificationView()
    }
}

struct CustomScrollView<Content: View>: View {
    var content: Content
    @Binding var offset: CGPoint
    var showIndicators: Bool
    var axis: Axis.Set
    
    init(offset: Binding<CGPoint>, showIndicators: Bool, axis: Axis.Set, @ViewBuilder content: ()->Content) {
        
        self.content = content()
        self._offset = offset
        self.showIndicators = showIndicators
        self.axis = axis
    }
    
    var body: some View {
        ScrollView(axis, showsIndicators: showIndicators, content: {
            content
        })
    }

}
