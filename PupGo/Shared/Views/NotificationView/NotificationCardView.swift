//
//  NotificationCardView.swift
//  PupGo
//
//  Created by Hsin-Wei Yu on 11/28/21.
//

import SwiftUI

struct NotificationCardView: View {
    @State var id: String
    @State var name: String
    @State var image: String
    //@State var age: String
    @EnvironmentObject var notificationObser: NotificationObserver
    // var notification: notification
    var body: some View {
        HStack(spacing: 15) {
            //ImageLoaderView(url: self.image)

            Button(action: {}) {
                AsyncImage(url: URL(string: self.image)) { image in
                    image.resizable()
                        .aspectRatio(contentMode: .fill)
                } placeholder: {
                    ProgressView()
                }
                .frame(width: 60, height: 60)
                .clipShape(Circle())
            }
            //.buttonStyle(.plain)
            
            VStack {
                HStack {
                    VStack(alignment: .leading, spacing: 8) {
                        Text(self.name)
                            .fontWeight(.bold)
                            .foregroundColor(brownColor)
                        Text("Notification Message here")
                            .font(.caption)
                            .foregroundColor(deepBrownColor)
                    }
                    Spacer(minLength: 10)
                    Text("Time here")
                        .font(.caption2)
                        .foregroundColor(.gray)
                }
                
                Divider()
            }
        }
        .padding(.horizontal)
    }
}

struct NotificationCardView_Previews: PreviewProvider {
    static var previews: some View {
        MyNotificationView()
    }
}
