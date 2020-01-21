//
//  FeedViewController.swift
//  vkClient
//
//  Created by Egor Tereshonok on 1/21/20.
//  Copyright © 2020 Egor Tereshonok. All rights reserved.
//

import UIKit

class FeedViewController: UIViewController {
    
    private let networkService: Networking = NetworkService()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.3725763559, green: 0.679697752, blue: 0.9031428695, alpha: 1)
        let params = ["filters": "post, photo"]
        networkService.request(path: API.newsFeed, params: params) {(data, error) in
            if let error = error {
                print("Error recived requesting data: \(error.localizedDescription)")
            }
            guard let data = data else { return }
            let json = try? JSONSerialization.jsonObject(with: data, options: [])
            print("json: \(json)")
        }
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
