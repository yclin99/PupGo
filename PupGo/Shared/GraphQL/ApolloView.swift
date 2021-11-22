//
//  ApolloView.swift
//  PupGo (iOS)
//
//  Created by Hsin-Wei Yu on 11/21/21.
//

import SwiftUI


struct ApolloView: View {
    @State var ApolloString = ""
    var body: some View {
        ZStack {
            lightYellowColor
            VStack {
                Text(ApolloString)
                    .frame(width: 100, height: 100)
                    .foregroundColor(.black)
            }
        }
        .onAppear {
            Network.shared.apollo.fetch(query: Testing1Query()) { result in
                switch result {
                case .success(let graphqlResult):
                    DispatchQueue.main.async {
                        if let myString = graphqlResult.data?.recommendationGet.result.first?.pet?.breed {
                            self.ApolloString = myString
                            print (self.ApolloString)
                            print ("Query Success!")
                        } else {
                            print ("Found not thing")
                        }
                    }
                    
                case .failure(let error):
                    print("Error: \(error)")
                }
            }
        }
    }
}
