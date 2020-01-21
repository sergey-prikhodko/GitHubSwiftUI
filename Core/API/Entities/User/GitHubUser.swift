//
//  GitHubUser.swift
//  Core
//
//  Created by Sergey Prikhodko on 17.01.2020.
//  Copyright © 2020 Sergey Prikhodko. All rights reserved.
//

import Foundation

public struct GitHubUser: Decodable {
    
    public let login: String
    public let id: Int
    public let avatarUrl: String
    public let url: String
    public let score: Double

    enum CodingKeys: String, CodingKey {
        
        case avatarUrl = "avatar_url"
        
        case login
        case id
        case url
        case score
    }
}

// MARK: - Empty
public extension GitHubUser {
    
    static var sergey: GitHubUser {
        return GitHubUser(login: "sergey-prikhodko",
                          id: 937,
                          avatarUrl: "https://avatars0.githubusercontent.com/u/25432228?v=4",
                          url: "",
                          score: 322.8)
    }
}
