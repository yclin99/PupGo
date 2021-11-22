//
//  TabEffect.swift
//  PupGo (iOS)
//
//  Created by Hsin-Wei Yu on 11/19/21.
//

import SwiftUI

struct TabEffect: UIViewRepresentable {
    var style: UIBlurEffect.Style
    func makeUIView(context: Context) -> UIVisualEffectView {
        
        let view = UIVisualEffectView(effect: UIBlurEffect(style: style))
        return view
    }
    
    func updateUIView(_ uiView: UIVisualEffectView, context: Context) {
        
    }
}
