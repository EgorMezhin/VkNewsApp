//
//  FeedViewController.swift
//  VKFeedApp
//
//  Created by Egor Lass on 24.02.2021.
//  Copyright © 2021 Egor Mezhin. All rights reserved.
//

import UIKit

class FeedViewController: UIViewController {
    
    private var fetcher: DataFetcher = NetworkDataFetcher(networking: NetworkService())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetcher.getFeed { (feedResponse) in
            guard let feedResponse = feedResponse else { return }
            feedResponse.items.map { (feedItem) in
                print(feedItem.date)
            }
        }
        
        view.backgroundColor = .systemBlue
    }
}
