//
//  MatchingSwipe.swift
//  PupGo
//
//  Created by Hsin-Wei Yu on 11/9/21.
//

import Foundation
import UIKit

struct SwipeCard: Identifiable {
    let id = UUID()
    let name: String
    let imageName: String
    let age: Int
    let bio: String
    
    var x: CGFloat = 0.0
    var y: CGFloat = 0.0
    var degree: Double = 0.0
    
    static var data: [SwipeCard] {
        [
            SwipeCard(name: "Dog0", imageName: "dog0", age: 1, bio: "Hey! I'm A."),
            SwipeCard(name: "Dog2", imageName: "dog2", age: 3, bio: "Hey! I'm C."),
            SwipeCard(name: "Dog3", imageName: "dog3", age: 4, bio: "Hey! I'm D."),
            SwipeCard(name: "Dog4", imageName: "dog4", age: 5, bio: "Hey! I'm E."),
            SwipeCard(name: "Dog5", imageName: "dog5", age: 6, bio: "Hey! I'm F."),
            SwipeCard(name: "Dog6", imageName: "dog6", age: 7, bio: "Hey! I'm G."),
        ]
    }
}
