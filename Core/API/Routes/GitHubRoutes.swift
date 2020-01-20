//
//  GitHubRoutes.swift
//  Core
//
//  Created by Sergey Prikhodko on 17.01.2020.
//  Copyright © 2020 Sergey Prikhodko. All rights reserved.
//

import Foundation
import Alamofire

enum GitHubRoutes: ApiRoute {
    
    case users(String)
    
    var url: URLConvertible {
        switch self {
        case .users(let term):
            return "https://api.github.com/search/users?q=\(term)"
        }
    }
    
    var headers: HTTPHeaders {
        switch self {
        case .users:
            return ["Accept": "application/vnd.github.machine-man-preview+json"]
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .users:
            return .get
        }
    }
    
    var encoder: JSONEncoder {
        switch self {
        case .users:
            return JSONEncoder()
        }
    }
}
