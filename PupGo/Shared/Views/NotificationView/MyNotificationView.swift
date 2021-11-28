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
            CustomScrollView(offset: $offset, showIndicators: true, axis: .vertical, content: {
                VStack(spacing: 15) {
                    
                    ForEach(self.notificationObserver.notifications) {i in
                        Group {
                            HStack(spacing: 15) {
                                
                                Circle()
                                    .fill(Color.gray.opacity(0.6))
                                    .frame(width: 70, height: 70)
                                    .onAppear {
                                        print(i.notificationType)
                                    }
                                /*
                                VStack(alignment: .leading, spacing: 15, content: {
                                    Rectangle()
                                        .fill(Color.gray.opacity(0.6))
                                        .frame(height: 15)
                                })
                                 */
                            }
                            .padding(.horizontal)
                        }
                    }
                }
                .padding(.top)
            })
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
