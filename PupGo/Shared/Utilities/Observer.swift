//
//  Observer.swift
//  PupGo
//
//  Created by Hsin-Wei Yu on 11/24/21.
//

import Foundation
import SwiftUI
import Combine

struct SwipeView: View {
    @StateObject var obser = observer
    var body: some View {
        GeometryReader {geo in
            ZStack {
                // AsyncImage(url: URL(string: "https://mymodernmet.com/wp/wp-content/uploads/2020/10/cooper-baby-corgi-dogs-8.jpg"))
                
                ForEach(self.obser.users) {i in
                    AsyncImage(url: URL(string: i.image))
                        //.resizable()
                        .frame(height: geo.size.height - 100)
                        //.padding(.vertical, 15)
                        .cornerRadius(20)
                }
            }
        }
    }
    
    func handleUpdate() {
    }
}

final class observer: ObservableObject {
    var willChange = PassthroughSubject<Void, Never>()
    @Published var users :[datatype] = []{
        willSet{
        print("will set")
            willChange.send()
        }
    }
    init() {
        let apolloNetwork = Network.shared.apollo
        //DispatchQueue.main.async {
        apolloNetwork.fetch(query: Testing1Query()) { result in
            
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
                
//                self.users.append(datatype(id: id, name: name, image: image, gender: gender, breed: breed, age: age, isCastration: isCastration, swipe: 0))
                var testData = datatype(id: id, name: name, image: image, gender: gender, breed: breed, age: age, isCastration: isCastration, swipe: 0)
                self.users.append(testData)
                //}
//                SwipeView().handleUpdate()
            }
            print("Users-temp", self.users)
            
        }
        print("Init: ", self.users)
        
    }
    
}

struct datatype: Identifiable {
    var id: String
    var name: String
    var image: String
    var gender: String
    var breed: String
    var age: String
    var isCastration: Bool
    var swipe: CGFloat
}

