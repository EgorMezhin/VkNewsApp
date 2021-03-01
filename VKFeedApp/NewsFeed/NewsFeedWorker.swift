//
//  NewsFeedWorker.swift
//  VKFeedApp
//
//  Created by Egor Lass on 25.02.2021.
//  Copyright (c) 2021 Egor Mezhin. All rights reserved.
//

import UIKit

class NewsFeedService {
    
    var authService: AuthService
    var networking: Networking
    var fetcher: DataFetcher
    
    private var revealPostIds = [Int]()
    private var feedResponse: FeedResponse?
    private var newFromInProcess: String?
    
    init() {
        self.authService = SceneDelegate.shared().authService
        self.networking = NetworkService(authService: authService)
        self.fetcher = NetworkDataFetcher(networking: networking)
    }
    
    func getUser(completion: @escaping (UserResponse?) -> Void) {
        fetcher.getUser { (userResponse) in
            completion(userResponse)
        }
    }
    func getFeed(completion: @escaping ([Int], FeedResponse) -> Void) {
        fetcher.getFeed(nextBatchFrom: nil) { [weak self] (feed) in
            self?.feedResponse = feed
            guard let feedResponse = self?.feedResponse else { return }
            completion(self!.revealPostIds, feedResponse)
        }
    }
    func revealPostIds(forPostId postId: Int, completion: @escaping ([Int], FeedResponse) -> Void) {
        revealPostIds.append(postId)
        guard let feedResponse = self.feedResponse else { return }
        completion(revealPostIds, feedResponse)
    }
    func getNextBatch(completion: @escaping ([Int], FeedResponse) -> Void) {
        newFromInProcess = feedResponse?.nextFrom
        fetcher.getFeed(nextBatchFrom: newFromInProcess) { [weak self] (feed) in
            guard let feed = feed else { return }
            guard self?.feedResponse?.nextFrom != feed.nextFrom else { return }
            
            if self?.feedResponse == nil {
                self?.feedResponse = feed
            } else {
                self?.feedResponse?.items.append(contentsOf: feed.items)
                var profiles = feed.profiles
                if let oldProfiles = self?.feedResponse?.profiles {
                    let oldProfilesFiltered = oldProfiles.filter({ (oldProfile) -> Bool in
                        !feed.profiles.contains(where: {$0.id == oldProfile.id })
                    })
                    profiles.append(contentsOf: oldProfilesFiltered)
                }
                self?.feedResponse?.profiles = profiles
                var groups = feed.groups
                if let oldGroups = self?.feedResponse?.groups {
                    let oldGroupFiltered = oldGroups.filter({ (oldGroup) -> Bool in
                        !feed.groups.contains(where: {$0.id == oldGroup.id })
                    })
                    groups.append(contentsOf: oldGroupFiltered)
                }
                self?.feedResponse?.groups = groups
                self?.feedResponse?.nextFrom = feed.nextFrom
            }
            guard let feedResponse = self?.feedResponse else { return }
            completion(self!.revealPostIds, feed)
        }
    }
}
