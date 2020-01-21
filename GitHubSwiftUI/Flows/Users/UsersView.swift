//
//  UsersView.swift
//  GitHubSwiftUI
//
//  Created by Sergey Prikhodko on 14.01.2020.
//  Copyright © 2020 Sergey Prikhodko. All rights reserved.
//

import SwiftUI
import Combine
import Core

struct UsersView: View {
    
    @ObservedObject var reducer = UsersReducer()
    
    private let onEditChanges: (Bool) -> Void = {
        debugPrint("on edit: \($0)")
    }
    private let onCommit: () -> Void = {
        debugPrint("on commit")
    }
    
    var body: some View {
        NavigationView {
            VStack {
                ZStack {
                    Color(UIColor.secondarySystemBackground)
                        .cornerRadius(10.0)
                    TextField("Search",
                              text: $reducer.searchTerm,
                              onEditingChanged: onEditChanges,
                              onCommit: onCommit)
                        .foregroundColor(Color(UIColor.label))
                        .offset(x: 15.0)
                        .padding(.trailing, 15.0)
                    }
                .frame(height: 50.0)
                .padding()
                List(reducer.cellReducers, id: \.id) {
                    UserCellView(reducer: $0)
                        .frame(height: 100)
                        .cornerRadius(8.0)
                }
            }
//            .padding()
            .navigationBarTitle("Users", displayMode: .large)
        }
    }
}

struct UsersView_Previews: PreviewProvider {
    static var previews: some View {
        UsersView()
    }
}
