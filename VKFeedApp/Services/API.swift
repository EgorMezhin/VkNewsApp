//
//  API.swift
//  VKFeedApp
//
//  Created by Egor Lass on 24.02.2021.
//  Copyright © 2021 Egor Mezhin. All rights reserved.
//

import Foundation

struct API {
    static let scheme = "https"
    static let host = "api.vk.com"
    static let version = "5.130"
    
    static let newsFeed = "/method/newsfeed.get"
    static let user = "/method/users.get"
}
