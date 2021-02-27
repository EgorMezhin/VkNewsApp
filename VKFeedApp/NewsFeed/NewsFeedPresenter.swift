//
//  NewsFeedPresenter.swift
//  VKFeedApp
//
//  Created by Egor Lass on 25.02.2021.
//  Copyright (c) 2021 Egor Mezhin. All rights reserved.
//

import UIKit

protocol NewsFeedPresentationLogic {
  func presentData(response: NewsFeed.Model.Response.ResponseType)
}

class NewsFeedPresenter: NewsFeedPresentationLogic {
  weak var viewController: NewsFeedDisplayLogic?
    var cellLayoutCalculator: NewsFeedCellLayoutCalculatorProtocol = NewsFeedCellLayoutCalculator()
    
    var dateFormatter: DateFormatter {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "ru_RU")
        dateFormatter.dateFormat = "d MMM 'в' HH:mm"
        return dateFormatter
    }
  
  func presentData(response: NewsFeed.Model.Response.ResponseType) {
  
    switch response {
    case .presentNewsFeed(feed: let feed):
        let cells = feed.items.map { (feedItem) in
            cellViewModel(from: feedItem, profiles: feed.profiles, groups: feed.groups)
        }
        
        
        let feedViewModel = FeedViewModel.init(cells: cells)
        
        viewController?.displayData(viewModel: NewsFeed.Model.ViewModel.ViewModelData.displayNewsFeed(feedViewModel: feedViewModel))
    }
  }
  
    private func cellViewModel(from feedItem: FeedItem, profiles: [Profile], groups: [Group]) -> FeedViewModel.Cell {
        
        
        let date = Date(timeIntervalSince1970: feedItem.date)
        let dateTitle = dateFormatter.string(from: date)
        
        let profile = self.profile(for: feedItem.sourceId, profiles: profiles, groups: groups)
        
        let photoAttachment = self.photoAttachment(feedItem: feedItem)
        
        let sizes = cellLayoutCalculator.sizes(postText: feedItem.text, photoAttachment: photoAttachment)
        
     //   print(feedItem.comments?.count)
        return FeedViewModel.Cell.init(
            iconURLString: profile.photo,
            name: profile.name,
            date: dateTitle,
            text: feedItem.text,
            likeNumber: String(feedItem.likes?.count ?? 0),
            commentNumber: String(feedItem.comments?.count ?? 0),
            shareNumber: String(feedItem.reposts?.count ?? 0),
            viewNumber: String(feedItem.views?.count ?? 0),
            photoAttachment: photoAttachment,
            sizes: sizes)
        
    }

    
    private func profile(for sourceId: Int, profiles: [Profile], groups: [Group]) -> ProfileRepresentable {
        
        let profilesAndGroups: [ProfileRepresentable] = sourceId >= 0 ? profiles : groups
        let normalSourceId = sourceId >= 0 ? sourceId : -sourceId
        let profileRepresentable = profilesAndGroups.first { (myProfileRepresentable) -> Bool in
            myProfileRepresentable.id == normalSourceId
        }
        return profileRepresentable!
    }
    
    private func photoAttachment(feedItem: FeedItem) -> FeedViewModel.FeedCellPhotoAttachment? {
        guard let photos = feedItem.attachments?.compactMap({ (attachment) in
            attachment.photo
        }), let firstPhoto = photos.first else {
            return nil
        }
        return FeedViewModel.FeedCellPhotoAttachment.init(photoUrlString: firstPhoto.url, width: firstPhoto.width, height: firstPhoto.height)
    }
}
