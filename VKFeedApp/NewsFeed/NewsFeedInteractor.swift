//
//  NewsFeedInteractor.swift
//  VKFeedApp
//
//  Created by Egor Lass on 25.02.2021.
//  Copyright (c) 2021 Egor Mezhin. All rights reserved.
//

import UIKit

protocol NewsFeedBusinessLogic {
    func makeRequest(request: NewsFeed.Model.Request.RequestType)
}

class NewsFeedInteractor: NewsFeedBusinessLogic {
    
    var presenter: NewsFeedPresentationLogic?
    var service: NewsFeedService?
    
    func makeRequest(request: NewsFeed.Model.Request.RequestType) {
        if service == nil {
            service = NewsFeedService()
        }
        switch request {
        case .getNewsFeed:
            service?.getFeed(completion: { [weak self] (revealedPostIds, feed) in
                self?.presenter?.presentData(response: NewsFeed.Model.Response.ResponseType.presentNewsFeed(feed: feed, revealPostIds: revealedPostIds))
            })
        case .revealPostIds(postId: let postId):
            service?.revealPostIds(forPostId: postId, completion: { [weak self]     (revealedPostIds, feed) in
                self?.presenter?.presentData(response: NewsFeed.Model.Response.ResponseType.presentNewsFeed(feed: feed, revealPostIds: revealedPostIds))
            })
        case .getUserAvatar:
            service?.getUser(completion: { [weak self] (user) in
                self?.presenter?.presentData(response: NewsFeed.Model.Response.ResponseType.presentUserInfo(user: user))
            })
        case .getNextBatch:
            service?.getNextBatch(completion: { (revealedPostIds, feed) in
                self.presenter?.presentData(response: NewsFeed.Model.Response.ResponseType.presentNewsFeed(feed: feed, revealPostIds: revealedPostIds))
            })
        }
    }
}
