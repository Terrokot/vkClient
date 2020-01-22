//
//  FeedViewController.swift
//  vkClient
//
//  Created by Egor Tereshonok on 1/21/20.
//  Copyright © 2020 Egor Tereshonok. All rights reserved.
//

import UIKit

class FeedViewController: UIViewController {
    
    //private let networkService: Networking = NetworkService()
    private var fether: DataFetcher = NetworkDataFetcher(networking: NetworkService())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.3725763559, green: 0.679697752, blue: 0.9031428695, alpha: 1)
        fether.getFeed { (feedResponse) in
            guard let feedResponse = feedResponse else { return }
            feedResponse.items.map { (feedItem) in
                print(feedItem.date)
            }
        }
            
        /*
        let params = ["filters": "post, photo"]
        networkService.request(path: API.newsFeed, params: params) {(data, error) in
            if let error = error {
                print("Error recived requesting data: \(error.localizedDescription)")
            }
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            guard let data = data else { return }
           // let json = try? JSONSerialization.jsonObject(with: data, options: [])
           // print("json: \(json)")
            let response = try? decoder.decode(FeedResponseWrapped.self, from: data)
           // print(response ?? " ")
            response?.response.items.map({(feedItem) in
                print(feedItem.text)
            })
        }
 */

    }

}
