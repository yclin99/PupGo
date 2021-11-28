//
//  NotificationCardView.swift
//  PupGo
//
//  Created by Hsin-Wei Yu on 11/28/21.
//

import SwiftUI

struct NotificationCardView: View {
    @State var id: String
    // @State var name: String
    @State var image: String
    //@State var age: String
    @EnvironmentObject var notificationObser: NotificationObserver
    // var notification: notification
    var body: some View {
        HStack(spacing: 15) {
            ImageLoaderView(url: self.image)
        }
    }
}

struct NotificationCardView_Previews: PreviewProvider {
    static var previews: some View {
        MyNotificationView()
    }
}
