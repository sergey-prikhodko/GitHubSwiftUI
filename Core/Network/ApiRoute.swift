//
//  ApiRoute.swift
//  Core
//
//  Created by Sergey Prikhodko on 17.01.2020.
//  Copyright © 2020 Sergey Prikhodko. All rights reserved.
//

import Alamofire

protocol ApiRoute {
    
    var url: URLConvertible { get }
    var headers: HTTPHeaders { get }
    var method: HTTPMethod { get }
    var encoder: JSONEncoder { get }
}
