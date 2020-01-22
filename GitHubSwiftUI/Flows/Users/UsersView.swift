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
    
    private let onEditChanges: (Bool) -> Void = { _ in
    }
    private let onCommit: () -> Void = {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to:nil, from:nil, for:nil)
    }
    
    var body: some View {
        NavigationView {
            List {
                ZStack {
                    Color(UIColor.secondarySystemBackground)
                        .cornerRadius(8.0)
                    TextField("Search",
                              text: $reducer.searchTerm,
                              onEditingChanged: onEditChanges,
                              onCommit: onCommit)
                        .foregroundColor(Color(UIColor.label))
                        .offset(x: 15.0)
                        .padding(.trailing, 30.0)
                }
                .frame(height: 50.0)
                ForEach(reducer.cellReducers) {
                    UserCellView(reducer: $0)
                        .frame(height: 100)
                        .cornerRadius(8.0)
                }
            }
            .navigationBarTitle(Text("Users"))
        }.edgesIgnoringSafeArea(.top)
    }
}

struct UsersView_Previews: PreviewProvider {
    static var previews: some View {
        UsersView()
    }
}
