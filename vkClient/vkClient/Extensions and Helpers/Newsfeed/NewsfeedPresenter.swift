//
//  NewsfeedPresenter.swift
//  vkClient
//
//  Created by Egor Tereshonok on 1/22/20.
//  Copyright (c) 2020 Egor Tereshonok. All rights reserved.
//

import UIKit

protocol NewsfeedPresentationLogic {
  func presentData(response: Newsfeed.Model.Response.ResponseType)
}

class NewsfeedPresenter: NewsfeedPresentationLogic {
  weak var viewController: NewsfeedDisplayLogic?
  
  func presentData(response: Newsfeed.Model.Response.ResponseType) {
  
  }
  
}
