//
//  Apollo.swift
//  PupGo (iOS)
//
//  Created by Hsin-Wei Yu on 11/21/21.
//

import Foundation
import Apollo

class Network {
    static let shared = Network()
    lazy var apollo = ApolloClient(url: URL(string: "http://140.114.71.70:17081/query")!)
    
}
