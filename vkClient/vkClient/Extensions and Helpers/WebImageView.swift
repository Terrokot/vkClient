//
//  WebImageView.swift
//  vkClient
//
//  Created by Egor Tereshonok on 1/23/20.
//  Copyright © 2020 Egor Tereshonok. All rights reserved.
//

import UIKit

class WebImageView: UIImageView {
    func set(imageURL: String?) {
        guard let imageURL = imageURL, let url = URL(string: imageURL) else {
            self.image = nil
            return }
        
        //check cache
        if let cachedResponse = URLCache.shared.cachedResponse(for: URLRequest(url: url)) {
            self.image = UIImage(data: cachedResponse.data)
            print("from cache")
            return
        }
        print("frome web")

        let dataTask = URLSession.shared.dataTask(with: url) { [weak self] (data, response, error) in
            DispatchQueue.main.async {
                if let data = data, let response = response {
                    self?.image = UIImage(data: data)
                    self?.hadleLoadedImage(data: data, response: response)

                }
            }
        }
        dataTask.resume()
    }
    private func hadleLoadedImage(data: Data, response: URLResponse) {
        guard let responseURL = response.url else { return }
        let cachedResponse = CachedURLResponse(response: response, data: data)
        URLCache.shared.storeCachedResponse(cachedResponse, for: URLRequest(url: responseURL))
    }
}
