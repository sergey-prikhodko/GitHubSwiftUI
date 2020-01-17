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
    
    case users
    
    var url: URLConvertible {
        switch self {
        case .users:
            return ""
        }
    }
    
    var headers: HTTPHeaders {
        switch self {
        case .users:
            return [:]
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
