//
//  SingleEventView.swift
//  PupGo_TextField
//
//  Created by ace_ye on 11/7/21.
//

import SwiftUI

struct SingleEventView: View {
    var content : Event
    
    var photoview: some View {
        ZStack{
        Color(#colorLiteral(red: 1, green: 1, blue: 0.88, alpha: 255)).edgesIgnoringSafeArea(.all)
        ZStack {
            Rectangle()
                .fill(Color.secondary)
            .frame(width: 200, height: 200)
            content.image.resizable().scaledToFit()
            }
        }
    }

    
    var join: some View {
        Button(action: {
          true
        }, label: {
            Text("Join").font(.system(size: 20)).bold().foregroundColor(.white)
                .background(RoundedRectangle(cornerRadius: 1).fill(Color.yellow).frame(width: 160, height: 50))
        })
            .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
        
    }
    var body: some View {
        ZStack {
            Color(#colorLiteral(red: 1, green: 1, blue: 0.88, alpha: 255)).edgesIgnoringSafeArea(.all)
        VStack(alignment: .leading) {
        photoview
        VStack(alignment: .leading){
        HStack(alignment: .center) {
            Image(systemName: "pawprint.circle").font(.largeTitle)
            Text("Username:")
                .font(.callout)
                .bold()
            Text(content.username).font(.callout).foregroundColor(.black).bold()}
        }.padding()
        HStack(alignment: .center) {
            Image(systemName: "clock").font(.largeTitle)
            Text("Start Time:")
                .font(.callout)
                .bold()
            Text(content.starttime).font(.callout).foregroundColor(.black).bold()}
        .padding()
        HStack(alignment: .center) {
            Image(systemName: "clock.fill").font(.largeTitle)
            Text("End Time:  ")
                .font(.callout)
                .bold()
            Text(content.endtime).font(.callout).foregroundColor(.black).bold()}
        .padding()
        HStack(alignment: .center) {
            Image(systemName: "location").font(.largeTitle)
            Text("Location:   ")
                .font(.callout)
                .bold()
            Text(content.location).font(.callout).foregroundColor(.black).bold()}
        .padding()
        Spacer()
            HStack {
                Spacer()
                join
                Spacer()
            }
        }
        
    }
    }
}


//struct SingleEventView_Previews: PreviewProvider {
//    static var previews: some View {
//        SingleEventView()
//    }
//}
