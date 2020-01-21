//
//  UserCellReducer.swift
//  GitHubSwiftUI
//
//  Created by Sergey Prikhodko on 16.01.2020.
//  Copyright © 2020 Sergey Prikhodko. All rights reserved.
//

import Combine
import SwiftUI
import Alamofire
import Core

final class UserCellReducer: ObservableObject, Identifiable {
    
    var id: Int { return user.id }
    var detailedLink: some View {
        return UserDetailsView(user: user)
    }
    
    @Published var initials = ""
    @Published var image = Image(uiImage: UIImage())
    
    private let user: GitHubUser
    
    init(_ user: GitHubUser) {
        self.user = user
        
        setup()
    }
    
    // MARK: - Private funcs
    
    private func setup() {
        initials = "\(user.login)"
        
        guard let url = URL(string: user.avatarUrl) else { return }
        
        
        AF.request(url, method: .get).responseData { [weak self] response in
            guard let self = self, let data = response.data else { return }
            self.provide(image: data)
        }
    }
    
    private func provide(image data: Data) {
        image = Image(uiImage: UIImage(data: data) ?? UIImage())
    }
}
