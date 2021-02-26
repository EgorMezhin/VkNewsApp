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
  
  func presentData(response: NewsFeed.Model.Response.ResponseType) {
  
    switch response {
    case .presentNewsFeed(feed: let feed):
        let cells = feed.items.map { (feedItem) in
            cellViewModel(from: feedItem)
        }
        
        
        let feedViewModel = FeedViewModel.init(cells: cells)
        
        viewController?.displayData(viewModel: NewsFeed.Model.ViewModel.ViewModelData.displayNewsFeed(feedViewModel: feedViewModel))
    }
  }
  
    private func cellViewModel(from feedItem: FeedItem) -> FeedViewModel.Cell {
        return FeedViewModel.Cell.init(
            iconURLString: "",
            name: "name",
            date: "date",
            text: feedItem.text,
            likeNumber: String(feedItem.likes?.count ?? 0),
            commentNumber: String(feedItem.comments?.count ?? 0),
            shareNumber: String(feedItem.reposts?.count ?? 0),
            viewNumber: String(feedItem.views?.count ?? 0))
    }
}
