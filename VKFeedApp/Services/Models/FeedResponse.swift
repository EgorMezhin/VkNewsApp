//
//  FeedResponse.swift
//  VKFeedApp
//
//  Created by Egor Lass on 25.02.2021.
//  Copyright © 2021 Egor Mezhin. All rights reserved.
//

import Foundation

struct FeedResponseWrapped: Decodable {
    let response: FeedResponse
}

struct FeedResponse: Decodable {
    var items: [FeedItem]
    var profiles: [Profile]
    var groups: [Group]
    var nextFrom: String?
}

struct FeedItem: Decodable {
    let sourceId: Int
    let postId: Int
    let text: String?
    let date: Double
    let comments: CountableItem?
    let likes: CountableItem?
    let reposts: CountableItem?
    let views: CountableItem?
    let attachments: [Attachment]?
}

struct CountableItem: Decodable {
    let count: Int
}

struct Attachment: Decodable {
    let photo: Photo?
}

struct Photo: Decodable {
    let sizes: [PhotoSize]
    var height: Int {
        return getSize().height
    }
    var width: Int {
        return getSize().width
    }
    var url: String {
        return getSize().url
    }
    private func getSize() -> PhotoSize {
        let errorMessage = "wrong image"
        if let sizeX = sizes.first(where: { $0.type == "x"}) {
            return sizeX
        } else if let fallBackSize = sizes.last {
            return fallBackSize
        } else {
            return PhotoSize(type: errorMessage, url: errorMessage, width: 0, height: 0)
        }
    }
}

struct PhotoSize: Decodable {
    let type: String
    let url: String
    let width: Int
    let height: Int
}
