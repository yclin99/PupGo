//
//  JoinRequestView.swift
//  NotificationView
//
//  Created by Yuchen Liu on 11/10/21.
//
import SwiftUI

struct JoinRequestView: View {
    
    let card: Card
    @State private var isShowingAnswer = false
    let onActivate: () -> ()
    
    var body: some View {
        let pic = card.pic
                .resizable()
                //.frame(width: 210, height: 250)
                //.aspectRatio(3/4, contentMode: .fill)
                //.scaledToFill()
                .frame(width: 170, height: 180)
                .aspectRatio(3/4, contentMode: .fill)
                //.frame(width: 330.0, height: 150.0,alignment: .center)
                //.clipped()
                .cornerRadius(20)
                .shadow(color: Color.red,  radius: 5.0, x: 10, y: -10)
        let back = RoundedRectangle(cornerRadius: 20, style: .circular)
            .shadow(color: Color.black, radius: 5.0 )            .foregroundColor(.black.opacity(0.2))
            .frame(width: 170, height: 180.0)
        
        ZStack {
            pic
            
            if isShowingAnswer {
                back
                VStack(alignment: .center){
                    Text(card.who + " Joins")
                            .font(.system(size: 20))
                            .fontWeight(.bold)
                            .foregroundColor(.red)
                    
                    HStack(alignment: .center) {
                        
                        Button(action: {
                            print("accept")
                            
                            self.onActivate()
                        }
                            , label: {
                            Circle()
                                .fill(Color.white)
                                .frame(width: 75, height: 75)
                                .shadow(radius: 10)
                                .overlay(
                                    Image(systemName: "person.crop.circle.fill.badge.plus")
                                        .font(.largeTitle)
                                        .foregroundColor(Color.green)
                                )
                            
                            
                        })
                        
                        /*
                        Spacer()
                        
                        Button(action: {
                            print("checkWho")
                            
                        }
                            , label: {
                            Circle()
                                .fill(Color.pink)
                                .frame(width: 75, height: 75)
                                .shadow(radius: 10)
                                .overlay(
                                    Image(systemName: "person.crop.circle.badge.questionmark.fill")
                                        .font(.largeTitle)
                                        .foregroundColor(Color.orange)
                                )
                            
                            
                        })
                        */
                        
                        Spacer()
                        
                        Button(action: {
                            print("deny")
                            self.onActivate()
                            
                        }
                            , label: {
                            Circle()
                                .fill(Color.black)
                                .frame(width: 75, height: 75)
                                .shadow(radius: 10)
                                .overlay(
                                    Image(systemName: "person.crop.circle.fill.badge.xmark")
                                        .font(.largeTitle)
                                        .foregroundColor(Color.red)
                                )
                            
                            
                        })
            }
                }
            }
            }
        .frame(width: 350.0, height: 180.0)
        .onTapGesture {
        self.isShowingAnswer.toggle()
        }
        
    }
}
