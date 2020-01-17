//
//  UsersResponse.swift
//  Core
//
//  Created by Sergey Prikhodko on 17.01.2020.
//  Copyright © 2020 Sergey Prikhodko. All rights reserved.
//

import Foundation

struct UsersResponse: Decodable {
    
    let totalCount: Int
    let incompleteResults: Bool
    let items: [GitHubUser]
    
    enum CodingKeys: String, CodingKey {
        
        case totalCount = "total_count"
        case incompleteResults = "incomplete_results"
        
        case items
    }
}
