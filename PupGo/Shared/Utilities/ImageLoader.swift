//
//  ImageLoader.swift
//  PupGo
//
//  Created by Hsin-Wei Yu on 11/26/21.
//

import Foundation
import UIKit

class ImageLoader: ObservableObject {
    let url: String?
    @Published var image: UIImage? = nil
    @Published var isLoading: Bool = false
    
    init (url: String?) {
        self.url = url
    }
    
    func fetch() {
        
        guard image == nil && !isLoading else {
            return
        }
        
        guard let url = url, let fetchURL = URL(string: url) else {
            print("url not existed")
            return
        }
        
        isLoading = true
        
        let task = URLSession.shared.dataTask(with: fetchURL) { [unowned self] data, response, error in
            DispatchQueue.main.async {
                self.isLoading = false
                if let error = error {
                    print(error.localizedDescription)
                } else if let response = response as? HTTPURLResponse, !(200...299).contains(response.statusCode) {
                    print("Error in Response")
                } else if let data = data, let image = UIImage(data: data) {
                    self.image = image
                } else {
                    print ("Unknown error")
                }
            }
        }
        
        task.resume()
    }
}
