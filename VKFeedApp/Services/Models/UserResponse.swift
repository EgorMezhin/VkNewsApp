//
//  UserResponse.swift
//  VKFeedApp
//
//  Created by Egor Lass on 01.03.2021.
//  Copyright © 2021 Egor Mezhin. All rights reserved.
//

import Foundation

struct UserResponseWrapped: Decodable {
    let response: [UserResponse]
}

struct UserResponse: Decodable {
    let photo100: String?
}
