//
//  UserEventView.swift
//  NotificationView
//
//  Created by Yuchen Liu on 11/10/21.
//

import SwiftUI

struct UserEventView: View {
    let card: Card
    @State private var isShowingAnswer = false
    @State private var isShowingDetailView = false
    @State var timeRemaining: String = ""
    
    func updateTimeRemaining(){
        let futureDate = dateFormatter.date(from: card.when)
        let remaining = Calendar.current.dateComponents([.hour, .minute, .second], from: Date() , to: futureDate!)
        let hour = remaining.hour ?? 0
        let minute = remaining.minute ?? 0
        let second = remaining.second ?? 0
        if hour > 0 {
            timeRemaining = "\(hour)h \(minute)m \(second)s"
        }
        else{
            timeRemaining = "\(minute)m \(second)s"
        }
    }
    var content : Event =
        Event(userid: "", username: "UglyDog", location: "UCLA GreenLand", starttime: "2021.11.8 3:00 pm", endtime: "2021.11.8 5:00 pm", image: Image("Dog1"), type: 0)

    let onActivate: () -> ()
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        let pic = card.pic
                .resizable()
//                .scaledToFill()
        
                .frame(width: 170, height: 180)
                .aspectRatio(3/4, contentMode: .fill)
                //.frame(width: 330.0, height: 150.0)
                //.clipped()
                .cornerRadius(20)
                .shadow(color: Color.green, radius: 5.0,
                        x: -5,
                        y: 0)

        let back = RoundedRectangle(cornerRadius: 20, style: .circular)
            .shadow(color: Color.black, radius: 5.0 )
            .foregroundColor(.black.opacity(0.4))
            .frame(width: 170.0, height: 180.0)
        ZStack {
            pic
            
            if isShowingAnswer {
                back
                HStack(alignment: .center) {

                    Text("  ")
                    
                            .font(.system(size: 20))
                            .fontWeight(.bold)
                            .foregroundColor(.green)
                    
                    Spacer(minLength: 100)
                    VStack (alignment: .center) {
                        if isShowingAnswer {
                            
                        Text("Next Event")
                                .font(.system(size: 20))
                                .fontWeight(.bold)
                                .foregroundColor(.green)
                            
                        
                        Text("Rest: "+timeRemaining)
                                .font(.body)
                            .foregroundColor(.white)
                            .onReceive(timer, perform: {_ in
                                updateTimeRemaining()
                            })
                            
                        Text("Owner: " + card.who)
                            .font(.body)
                            .foregroundColor(.white)
                            //Text("Scheduled at: " + dateFormatter.string(from: launchedDate))
                        Text("Scheduled: " + card.launched.prefix(10))
                            .font(.body)
                            .foregroundColor(.white)
                            
                        }
                    }
                    .padding(20)
                    .multilineTextAlignment(.center)
                    Spacer(minLength: 5)
                    NavigationLink(destination: SingleEventView(content: content), isActive: $isShowingDetailView) {EmptyView()}
                    
                    
                    Button(action: {
                                print("check event")
                                isShowingDetailView = true
                                self.onActivate()
                            
                        }
                                , label: {
                                Circle()
                                    .fill(Color.yellow)
                                    .frame(width: 75, height: 75)
                                    .shadow(radius: 10)
                                    .overlay(
                                        Image(systemName: "eyes")
                                            .font(.largeTitle)
                                            .foregroundColor(Color.black)
                                    )
                                
                                
                            }
                    )
                
                }
                
            }
            
        }
        .frame(width: 350.0, height: 180.0)
        .onTapGesture {
                self.isShowingAnswer.toggle()}
}
}



