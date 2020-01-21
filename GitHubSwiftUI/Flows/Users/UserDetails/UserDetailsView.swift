//
//  UserDetailsView.swift
//  GitHubSwiftUI
//
//  Created by Sergey Prikhodko on 20.01.2020.
//  Copyright © 2020 Sergey Prikhodko. All rights reserved.
//

import SwiftUI
import Core

struct UserDetailsView: View {
    
    @State var user: GitHubUser
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Hello, \(user.login)!")
                Spacer()
            }
        }
        .navigationBarTitle(user.login)
    }
}

struct UserDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        UserDetailsView(user: GitHubUser.sergey)
    }
}
