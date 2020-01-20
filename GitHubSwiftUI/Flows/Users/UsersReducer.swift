//
//  UsersReducer.swift
//  GitHubSwiftUI
//
//  Created by Sergey Prikhodko on 17.01.2020.
//  Copyright © 2020 Sergey Prikhodko. All rights reserved.
//

import Core
import Combine

final class UsersReducer: ObservableObject {
    
//    var reducers = AnyPublisher<[UserCellReducer], nil>()
    
    @Published var cellReducers: [UserCellReducer] = []
    
    var numberOfRows: AnyPublisher<Int, Never> {
        return cellReducers.publisher.receive(on: DispatchQueue.main).count().eraseToAnyPublisher()
    }
    
    init() {
        go()
    }
    
    func go() {
        GitHubAPIFacade().getUsers(query: "sergey") { [weak self] response in
            guard let users = response.value else { return }
            
            self?.cellReducers = users.map { UserCellReducer($0) }
        }
    }
}
