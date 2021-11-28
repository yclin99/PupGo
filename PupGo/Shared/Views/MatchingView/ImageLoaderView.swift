//
//  ImageLoaderView.swift
//  PupGo
//
//  Created by Hsin-Wei Yu on 11/26/21.
//

import SwiftUI

struct ImageLoaderView: View {
    @StateObject var imageLoader: ImageLoader
    
    init(url:String?) {
        self._imageLoader = StateObject(wrappedValue: ImageLoader(url: url))
    }
    var body: some View {
        Group {
            if imageLoader.image != nil {
                Image(uiImage: imageLoader.image!)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 360, height: 480)
            } else {
                ProgressView()
                    .frame(width: 360, height: 480)
            }
        }
        .onAppear {
            imageLoader.fetch()
        }
    }
}

struct ImageLoaderView_Previews: PreviewProvider {
    static var previews: some View {
        ImageLoaderView(url: nil)
    }
}
