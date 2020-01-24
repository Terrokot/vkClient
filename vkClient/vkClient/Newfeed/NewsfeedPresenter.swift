//
//  NewsfeedPresenter.swift
//  vkClient
//
//  Created by Egor Tereshonok on 1/23/20.
//  Copyright (c) 2020 Egor Tereshonok. All rights reserved.
//

import UIKit
import Foundation
protocol NewsfeedPresentationLogic {
  func presentData(response: Newsfeed.Model.Response.ResponseType)
}

class NewsfeedPresenter: NewsfeedPresentationLogic {
  weak var viewController: NewsfeedDisplayLogic?
    
    
  
  func presentData(response: Newsfeed.Model.Response.ResponseType) {
  
    switch response {
    case .presentNewsfeed(let feed):
        let cells = feed.items.map { (feedItem) in
            cellViewModel(from: feedItem, profiles: feed.profiles, groups: feed.groups)
        }
        let feedViewModel = FeedViewModel.init(cells: cells)
        viewController?.displayData(viewModel: Newsfeed.Model.ViewModel.ViewModelData.displayNewsfeed(feedViewModel: feedViewModel))
    }
  }
    
    private func cellViewModel(from feedItem: FeedItem, profiles: [Profile], groups: [Group]) -> FeedViewModel.Cell {
        
        let profile = self.profile(for: feedItem.sourceId, profiles: profiles, groups: groups)
        let photoAttachment = self.photoAttachment(feedItem: feedItem)
        
            let dateFormatter = DateFormatter()
            dateFormatter.locale = Locale(identifier: "ru_RU")
            dateFormatter.dateFormat = "d MMM 'в' HH:mm"
        
        let date = Date(timeIntervalSince1970: feedItem.date)
        let dateTitle = dateFormatter.string(from: date)
        
        return FeedViewModel.Cell.init(iconUrlString: profile.photo,
                                               name: profile.name,
                                               date: dateTitle,
                                               text: feedItem.text,
                                               likes: String(feedItem.likes?.count ?? 0),
                                               comments: String(feedItem.comments?.count ?? 0),
                                               shares: String(feedItem.reposts?.count ?? 0),
                                               views: String(feedItem.views?.count ?? 0),
                                               photoAttachment: photoAttachment)
            }
            
            private func profile(for sourseId: Int, profiles: [Profile], groups: [Group]) -> ProfileRepresentable {
                
                let profilesOrGroups: [ProfileRepresentable] = sourseId >= 0 ? profiles : groups
                let normalSourseId = sourseId >= 0 ? sourseId : -sourseId
                let profileRepresenatable = profilesOrGroups.first { (myProfileRepresenatable) -> Bool in
                    myProfileRepresenatable.id == normalSourseId
                }
                return profileRepresenatable!
            }
            
    private func photoAttachment(feedItem: FeedItem) -> FeedViewModel.FeedCellphotoAttachment? {
                guard let photos = feedItem.attachments?.compactMap({ (attachment) in
                    attachment.photo
                }), let firstPhoto = photos.first else {
                    return nil
                }
        return FeedViewModel.FeedCellphotoAttachment.init(photoUrlString: firstPhoto.srcBIG,
                                                                  width: firstPhoto.width,
                                                                  height: firstPhoto.height)
            }
        }
