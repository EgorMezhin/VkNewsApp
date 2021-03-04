//
//  Profile.swift
//  VKFeedApp
//
//  Created by Egor Lass on 04.03.2021.
//  Copyright © 2021 Egor Mezhin. All rights reserved.
//

import Foundation

protocol ProfileRepresentable {
    var id: Int { get }
    var name: String { get }
    var photo: String { get }
}

struct Profile: Decodable, ProfileRepresentable {
    let id: Int
    let firstName: String
    let lastName: String
    var name: String { return firstName + " " + lastName }
    let photo100: String
    var photo: String { return photo100 }
}

struct Group: Decodable, ProfileRepresentable {
    let id: Int
    let name: String
    let photo100: String
    var photo: String { return photo100 }
}
