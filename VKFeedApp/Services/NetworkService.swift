//
//  NetworkService.swift
//  VKFeedApp
//
//  Created by Egor Lass on 24.02.2021.
//  Copyright © 2021 Egor Mezhin. All rights reserved.
//

import Foundation

final class NetworkSetvice {
    
    private let authService: AuthService
    
    init(authService: AuthService = SceneDelegate.shared().authService) {
        self.authService = authService
    }
    
    func getFeed() {
        var components = URLComponents()
        
        guard let token = authService.token else { return }
        let parameters = ["filters": "post,photo"]
        var allParameters = parameters
        allParameters["access_token"] = token
        allParameters["v"] = API.version
        components.scheme = API.scheme
        components.host = API.host
        components.path = API.newsFeed
        components.queryItems = allParameters.map { URLQueryItem.init(name: $0, value: $1)}
        
        let url = components.url!
        print(url)
    }
}
