//
//  NewsfeedInteractor.swift
//  vkClient
//
//  Created by Egor Tereshonok on 1/23/20.
//  Copyright (c) 2020 Egor Tereshonok. All rights reserved.
//

import UIKit

protocol NewsfeedBusinessLogic {
  func makeRequest(request: Newsfeed.Model.Request.RequestType)
}

class NewsfeedInteractor: NewsfeedBusinessLogic {

  var presenter: NewsfeedPresentationLogic?
  var service: NewsfeedService?
    
    private var fetcher: DataFetcher = NetworkDataFetcher(networking: NetworkService())
  
  func makeRequest(request: Newsfeed.Model.Request.RequestType) {
    if service == nil {
      service = NewsfeedService()
    }
    
    switch request {

    case .getNewsfeed:
        fetcher.getFeed { [weak self] (feedResponse) in
            
            guard let feedResponse = feedResponse else { return }
            self?.presenter?.presentData(response: Newsfeed.Model.Response.ResponseType.presentNewsfeed(feed: feedResponse))
        }
    }
  }
}
