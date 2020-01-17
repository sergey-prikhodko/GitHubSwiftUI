//
//  TabsView.swift
//  GitHubSwiftUI
//
//  Created by Sergey Prikhodko on 14.01.2020.
//  Copyright © 2020 Sergey Prikhodko. All rights reserved.
//

import SwiftUI
import Combine

struct TabsView: View {
    
    @State private var selection = 0
    
    var body: some View {
        TabView(selection: $selection) {
            UsersView().tabItem {
                Image(systemName: selection == 0 ? "person.3.fill" : "person.3")
                Text("Users")
            }
        }
    }
}

struct TabsView_Previews: PreviewProvider {
    static var previews: some View {
        TabsView()
    }
}
