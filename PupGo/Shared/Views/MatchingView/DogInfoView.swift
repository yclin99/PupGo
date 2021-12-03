//
//  DogInfoView.swift
//  PupGo (iOS)
//
//  Created by Hsin-Wei Yu on 11/27/21.
//

import SwiftUI

struct DogInfoView: View {
    @Binding var isShowing: Bool
    @State private var curHeight: CGFloat = 400
    @State private var isDragging = false
    @EnvironmentObject var obser: observer
    let minHeight: CGFloat = 400
    let maxHeight: CGFloat = 650
    let startOpacity: Double = 0.4
    let endOpacity: Double = 0.8
    
    var dragPercentage: Double {
        let res = Double((curHeight - minHeight) / (maxHeight - minHeight))
        return max(0, min(1, res))
    }
    
    var body: some View {
        ZStack (alignment: .bottom) {
            if isShowing {
                Color.black
                    .opacity(startOpacity + (endOpacity - startOpacity) * dragPercentage)
                    .ignoresSafeArea()
                    .onTapGesture {
                        isShowing = false
                    }
                
                mainView
                .transition(.move(edge: .bottom))
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
        .ignoresSafeArea()
        .animation(.spring(), value: 0.4)
    }
    
    var mainView: some View {
        VStack {
            ZStack {
                Capsule()
                    .frame(width: 40, height: 6)
                    .foregroundColor(brownColor)
            }
            .frame(height: 40)
            .frame(maxWidth: .infinity)
            .background(.white.opacity(0.00001))
            .gesture(dragGesture)
            
            ZStack (alignment: .topLeading) {
                VStack {
                    HStack {
                        Image(self.obser.users.last?.gender ==  "1" ? "male" : "female")
                            .resizable()
                            .frame(width: 80, height: 80)
                        VStack (alignment: .leading, spacing: 20){
                            HStack  {
                                Text("Name: ")
                                Text(self.obser.users.last?.name ?? "").font(.title2)
                            }.foregroundColor(deepBrownColor)
                            HStack {
                                Text("Birthday: ")
                                Text(self.obser.users.last?.birthday ?? "").font(.title)
                            }.foregroundColor(deepBrownColor)
                            
                            HStack {
                                Text("Breed: ")
                                Text(self.obser.users.last?.breed ?? "").font(.title)
                            }.foregroundColor(deepBrownColor)
                            HStack {
                                //Text("Gender: ").font(.title)
                                Text(self.obser.users.last?.description ?? "")
                            }.foregroundColor(deepBrownColor)
                        }
                        
                    }
                    Spacer()
                }
                
                //.padding(.horizontal, 30)
            }
            .frame(maxHeight: .infinity)
            .padding(.bottom, 35)
        }
        .frame(height: curHeight)
        .frame(maxWidth: .infinity)
        .background(
            ZStack {
                RoundedRectangle(cornerRadius: 30)
                Rectangle()
                    .frame(height: curHeight / 2)
            }
            .foregroundColor(lightBrownColor)
        )
        .animation(isDragging ? nil: .easeInOut(duration: 0.45))
        .onDisappear { curHeight = minHeight }
    }
    
    @State private var preDragTranslation = CGSize.zero
    
    var dragGesture: some Gesture {
        DragGesture(minimumDistance: 0, coordinateSpace: .global)
            .onChanged { val in
                if !isDragging {
                    isDragging = true
                }
                
                let dragAmount = val.translation.height - preDragTranslation.height
                if curHeight > maxHeight || curHeight < minHeight {
                    curHeight -= dragAmount / 6
                } else {
                    curHeight -= dragAmount
                }
                preDragTranslation = val.translation
            }
            .onEnded { val in
                preDragTranslation = .zero
                isDragging = false
                if curHeight > maxHeight {
                    curHeight = maxHeight
                } else if curHeight < minHeight {
                    curHeight = minHeight
                }
            }
    }
}

struct DogInfoView_Previews: PreviewProvider {
    static var previews: some View {
        DogInfoView(isShowing: .constant(true))
    }
}
