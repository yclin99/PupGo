//
//  Observer.swift
//  PupGo
//
//  Created by Hsin-Wei Yu on 11/24/21.
//

import Foundation
import SwiftUI
/*
struct SwipeView: View {
    @StateObject var obser = observer()
    var body: some View {
        GeometryReader {geo in
            ZStack {
                ForEach(self.obser.users) {i in
                    Group {
                        AsyncImage(url: URL(string: i.image)) { ima in
                            ima.resizable()
                        } placeholder: {
                            ProgressView()
                        }
                        .frame(width: 200, height: 200)
                        .aspectRatio(contentMode: .fill)
                        .cornerRadius(20)
                            //.frame(height: geo.size.height - 10)
                            
                    }
                    //.frame(width: geo.size.height - 10 , height: geo.size.height - 10)
                }
            }
        }
    }
}*/


class observer: ObservableObject {
    @Published var users = [datatype]()
    @Published var last = -1
    
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
                
                self.users.append(datatype(id: id, name: name, image: image, gender: gender, breed: breed, age: age, isCastration: isCastration))
            //}
            }
            
            //print("Users-temp", self.users)
            
        }
    }
    
    func update(id: datatype) {
        for i in 0..<self.users.count {
            if self.users[i].id == id.id {
                self.last = i
            }
        }
    }
    
    func goBack(index: Int) {
        
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
    var x: CGFloat = 0.0
    var y: CGFloat = 0.0
    var degree: Double = 0.0
}
