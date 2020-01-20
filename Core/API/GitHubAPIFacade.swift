//
//  GitHubAPIFacade.swift
//  Core
//
//  Created by Sergey Prikhodko on 17.01.2020.
//  Copyright © 2020 Sergey Prikhodko. All rights reserved.
//

import Foundation

public final class GitHubAPIFacade {
    
    public init() {}
    
    public func getUsers(query: String? = nil, completion: @escaping (ResponseModel<[GitHubUser]>) -> Void) {
        SimpleAPIClient.execute(GitHubRoutes.users(query ?? ""), request: EmptyBody()) { (response: ResponseModel<UsersResponse>) in
            if let users = response.value?.items {
                completion(ResponseModel(users))
            } else if let error = response.error {
                completion(ResponseModel(error))
            } else {
                completion(ResponseModel(UnknownError()))
            }
        }
    }
}
