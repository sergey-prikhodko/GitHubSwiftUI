//
//  SimpleAPIClient.swift
//  Core
//
//  Created by Sergey Prikhodko on 17.01.2020.
//  Copyright © 2020 Sergey Prikhodko. All rights reserved.
//

import Alamofire

final class SimpleAPIClient {
    
    static func execute<Request: Encodable, Response: Decodable>(_ route: ApiRoute,
                                                                 request: Request?,
                                                                 completion: @escaping (ResponseModel<Response>) -> Void) {
        do {
            var requestModel = try URLRequest(url: route.url, method: route.method, headers: route.headers)
            
            log("url:\t\t\(requestModel.url?.absoluteString ?? ":(")")
            log("method:\t\t\(requestModel.httpMethod ?? ":(")")
            log("headers:\t\(requestModel.allHTTPHeaderFields ?? [:])")
            
            if let parameters = request {
                
                let jsonData = try route.encoder.encode(parameters)
                requestModel.httpBody = jsonData
                let encodedObjectJsonString = String(data: jsonData, encoding: .utf8)
                log("parameters:\t\(encodedObjectJsonString ?? ":(")")
            }
            
            AF.request(requestModel).responseData { response in
                if let error = response.error {
                    completion(ResponseModel(error))
                    
                } else if let data = response.data {
                    do {
                        let result = try JSONDecoder().decode(Response.self, from: data)
                        let model = ResponseModel(result)
                        completion(model)
                        
                    } catch {
                        completion(ResponseModel(error))
                    }
                    
                } else {
                    completion(ResponseModel(UnknownError()))
                }
            }
        } catch {
            completion(ResponseModel(error))
        }
        
    }
}
