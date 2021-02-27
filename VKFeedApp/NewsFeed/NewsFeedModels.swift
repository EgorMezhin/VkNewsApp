//
//  NewsFeedModels.swift
//  VKFeedApp
//
//  Created by Egor Lass on 25.02.2021.
//  Copyright (c) 2021 Egor Mezhin. All rights reserved.
//

import UIKit

enum NewsFeed {
   
  enum Model {
    struct Request {
      enum RequestType {
        case getNewsFeed
      }
    }
    struct Response {
      enum ResponseType {
        case presentNewsFeed(feed: FeedResponse)
      }
    }
    struct ViewModel {
      enum ViewModelData {
        case displayNewsFeed(feedViewModel: FeedViewModel)
      }
    }
  }
}

struct FeedViewModel {
    struct Cell: FeedCellViewModel {
        var iconURLString: String
        var name: String
        var date: String
        var text: String?
        var likeNumber: String?
        var commentNumber: String?
        var shareNumber: String?
        var viewNumber: String?
        var photoAttachment: FeedCellPhotoAttachmentViewModel?
        var sizes: FeedCellSizes
    }
    
    struct FeedCellPhotoAttachment: FeedCellPhotoAttachmentViewModel {
        var photoUrlString: String?
        var width: Int
        var height: Int
    }
    
    let cells: [Cell]
}
