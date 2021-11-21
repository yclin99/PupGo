//
//  CurvedTabView.swift
//  PupGo (iOS)
//
//  Created by Hsin-Wei Yu on 11/19/21.
//

import SwiftUI

struct CurvedTabView: View {
    @State var currentTab: Tab = .Matching
    
    init() {
        UITabBar.appearance().isHidden = true
    }
    
    @Namespace var animation
    @State var currentXValue: CGFloat = 0
    
    var body: some View {
        TabView (selection: $currentTab) {
            MatchView()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(lightYellowColor).ignoresSafeArea()
                .tag(Tab.Matching)
            EventExploreContentView()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .tag(Tab.Exploration)
            NotificationView()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(lightYellowColor).ignoresSafeArea()
                .tag(Tab.Notification)
            SettingView()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(lightYellowColor).ignoresSafeArea()
                .tag(Tab.Setting)
        }.overlay(
            HStack(spacing: 0) {
                ForEach(Tab.allCases, id: \.rawValue) {tab in
                    TabButton(tab: tab)
                }
            }
                .padding(.vertical)
                .padding(.bottom, getSafeArea().bottom == 0 ? 10 : (getSafeArea().bottom - 10))
                .background(
                    TabEffect(style: .systemUltraThinMaterialDark)
                        .clipShape(ButtonCurve(currentXValue: currentXValue))
                )
            , alignment: .bottom
        )
        .ignoresSafeArea(.all, edges: .bottom)
        .preferredColorScheme(.dark)
    }
    
    @ViewBuilder
    func TabButton(tab: Tab) -> some View {
        GeometryReader {proxy in
            Button {
                withAnimation(.spring()) {
                    currentTab = tab
                    //updating value
                    currentXValue = proxy.frame(in: .global).midX
                }
            } label: {
                
                Image(systemName: tab.rawValue)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 25, height: 25)
                    .frame(maxWidth: .infinity)
                    .foregroundColor(.white)
                    .padding(currentTab == tab ? 15 : 0)
                    .background(
                        ZStack {
                            if currentTab == tab {
                                TabEffect(style: .systemUltraThinMaterialDark)
                                    .clipShape(Circle())
                                    .matchedGeometryEffect(id: "TAB", in: animation)
                            }
                        }
                    )
                    .contentShape(Rectangle())
                    .offset(y: currentTab == tab ? -50 : 0)
            }
            .onAppear {
                if tab == Tab.allCases.first && currentXValue == 0 {
                    currentXValue = proxy.frame(in: .global).midX
                }
            }
        }
        .frame(height: 30)
    }
}

struct CurvedTabView_Previews: PreviewProvider {
    static var previews: some View {
        CurvedTabView()
    }
}

enum Tab: String, CaseIterable {
    case Matching = "heart.fill"
    case Exploration = "magnifyingglass"
    case Notification = "message.fill"
    case Setting = "pawprint.fill"
}

extension View {
    func getSafeArea()->UIEdgeInsets {
        guard let screen = UIApplication.shared.connectedScenes.first as? UIWindowScene else {
            return .zero
        }
        
        guard let safeArea = screen.windows.first?.safeAreaInsets else {
            return .zero
        }
        return safeArea
    }
}

