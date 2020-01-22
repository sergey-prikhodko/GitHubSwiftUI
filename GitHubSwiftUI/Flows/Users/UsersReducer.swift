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
    
    private var cancellableStore = Set<AnyCancellable>()
    
    @Published var searchTerm = ""
    @Published var cellReducers: [UserCellReducer] = []
    
    
    let subject = PassthroughSubject<String, Never>()
    var publisher: AnyPublisher<String, Never> { return $searchTerm.eraseToAnyPublisher() }
    
    var subscriber: AnyCancellable = Just("").sink { _ in }
    var numberOfRows: AnyPublisher<Int, Never> {
        return cellReducers.publisher.receive(on: DispatchQueue.main).count().eraseToAnyPublisher()
    }
    
//    var searchPublisher: AnyPublisher<String, Never> {
//        return searchTerm.publisher.eraseToAnyPublisher().
//    }
    
    init() {
        subscriber = publisher.throttle(for: 1, scheduler: DispatchQueue.main, latest: false).sink { [weak self] in
            self?.search($0)
        }
//        searchTerm.publisher.
    }
    
    func search(_ term: String) {
        GitHubAPIFacade().getUsers(query: term) { [weak self] response in
            
            self?.cellReducers = (response.value ?? []).map { UserCellReducer($0) }
        }
    }
}
