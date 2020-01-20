//
//  SimpleAPIClient.swift
//  Core
//
//  Created by Sergey Prikhodko on 17.01.2020.
//  Copyright © 2020 Sergey Prikhodko. All rights reserved.
//

import Alamofire

final class SimpleAPIClient<Request: Encodable, Response: Decodable> {
    
    static func execute(_ route: ApiRoute,
                        request: Request? = nil,
                        completion: @escaping (ResponseModel<Response>) -> Void) {
        do {
            var requestModel = try URLRequest(url: route.url, method: route.method, headers: route.headers)
            
            
            
            if let parameters = request, !(parameters is EmptyBody) {
                
                let jsonData = try route.encoder.encode(parameters)
                requestModel.httpBody = jsonData
                let encodedObjectJsonString = String(data: jsonData, encoding: .utf8)
                log("parameters: \(encodedObjectJsonString ?? ":(")")
            }
            
            log("url: \(requestModel.url?.absoluteString ?? ":(")")
            log("method: \(requestModel.httpMethod ?? ":(")")
            log("headers: \(requestModel.allHTTPHeaderFields ?? [:])")
            
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
