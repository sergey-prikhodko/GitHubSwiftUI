//
//  GitHubAPIFacade.swift
//  Core
//
//  Created by Sergey Prikhodko on 17.01.2020.
//  Copyright © 2020 Sergey Prikhodko. All rights reserved.
//

import Foundation

public final class GitHubAPIFacade {
    
    public func getUsers(query: String? = nil, completion: @escaping (ResponseModel<[GitHubUser]>) -> Void) {
        SimpleAPIClient.execute(GitHubRoutes.users, request: EmptyBody()) { (response: ResponseModel<UsersResponse>) in
            
        }
    }
}
