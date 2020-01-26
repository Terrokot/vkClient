//
//  NewsfeedCellLayoutCalculator.swift
//  vkClient
//
//  Created by Egor Tereshonok on 1/25/20.
//  Copyright © 2020 Egor Tereshonok. All rights reserved.
//

import Foundation
import UIKit



protocol FeedCellLayoutCalculatorProtocol {
        func sizes(postText: String?, photoAttachment: FeedCellphotoAttachmentViewModel?) -> FeedCellSizes
   }

struct Sizes: FeedCellSizes {
       var postLabelFrame: CGRect
       var attachmentFrame: CGRect
   }

final class FeedCellLayoutCalculator: FeedCellLayoutCalculatorProtocol {
   
    
    private let screenWidth: CGFloat
    

    init(screenWidth: CGFloat = min(UIScreen.main.bounds.width, UIScreen.main.bounds.height)) {
        self.screenWidth = screenWidth
    }
    
    
    func sizes(postText: String?, photoAttachment: FeedCellphotoAttachmentViewModel?) -> FeedCellSizes {
        return Sizes(postLabelFrame: CGRect.zero, attachmentFrame: CGRect.zero)
        
       }
    
    
   
        
}
