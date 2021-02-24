//
//  FeedViewController.swift
//  VKFeedApp
//
//  Created by Egor Lass on 24.02.2021.
//  Copyright © 2021 Egor Mezhin. All rights reserved.
//

import UIKit

class FeedViewController: UIViewController {
    
    private let networkService = NetworkSetvice()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        networkService.getFeed()
        view.backgroundColor = .systemBlue
    }
}
