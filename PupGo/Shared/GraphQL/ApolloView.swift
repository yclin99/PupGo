//
//  ApolloView.swift
//  PupGo (iOS)
//
//  Created by Hsin-Wei Yu on 11/21/21.
//

import SwiftUI


struct ApolloView: View {
    
//    var test2 = DogProfile()
//    init() {
//        test2.manuaset(petname: "", image: Image("Dog1"))
//        Network.shared.apollo.perform(mutation: Testing2Mutation())
//    }
    
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
            print("Start Apollo View")
            
            Network.shared.apollo.fetch(query: Testing1Query()) { result in
                /*
                guard let data = try? result.get().data else {
                    print("Error: Fetching Data Error")
                    return
                }
                data.recommendationGet.result.forEach { networkUser in
                    let id = networkUser.pet?.id as! String
                    let name = networkUser.pet?.name as! String
                    let breed = networkUser.pet?.breed as! String
                    let image = networkUser.pet?.image as! String
                    let age = networkUser.pet?.birthday as! String
                    let gender = networkUser.pet?.gender?.rawValue as! String
                    let isCastration = networkUser.pet?.isCastration as! Bool
                    
                    print("ID: ", id)
                }*/
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
            print(self.ApolloString)
        }
    }
}
