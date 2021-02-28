//
//  NetworkDataFetcher.swift
//  VKFeedApp
//
//  Created by Egor Lass on 25.02.2021.
//  Copyright © 2021 Egor Mezhin. All rights reserved.
//

import Foundation

protocol DataFetcher {
    func getFeed(response: @escaping (FeedResponse?) -> Void)
    func getUser(response: @escaping (UserResponse?) -> Void)
}

struct NetworkDataFetcher: DataFetcher {

    private let authService: AuthService
    
    let networking: Networking
    
    init(networking: Networking, authService: AuthService = SceneDelegate.shared().authService) {
        self.networking = networking
        self.authService = authService
    }
    
    func getUser(response: @escaping (UserResponse?) -> Void) {
        guard let userId = authService.userId else { return }
        let params = ["user_ids": userId, "fields": "photo_100"]
        networking.request(path: API.user, parameters: params) { (data, error) in
                     if let error = error {
                   print("Error recieved requesting data: \(error.localizedDescription)")
                   response(nil)
               }
            let decoded = self.decodeJSON(type: UserResponseWrapped.self, from: data)
            response(decoded?.response.first)
        }
    }
    
    func getFeed(response: @escaping (FeedResponse?) -> Void) {
        let params = ["filters": "post, photo"]
        networking.request(path: API.newsFeed, parameters: params) { (data, error) in
            if let error = error {
                print("Error recieved requesting data: \(error.localizedDescription)")
                response(nil)
            }
            
            let decoded = self.decodeJSON(type: FeedResponseWrapped.self, from: data)
            response(decoded?.response)
        }
    }
    
    private func decodeJSON<T: Decodable>(type: T.Type, from: Data?) -> T? {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        guard let data = from, let response = try? decoder.decode(type.self, from: data) else { return nil }
        return response
    }
    
    
}
