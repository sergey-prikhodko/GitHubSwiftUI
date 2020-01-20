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
    
    @State private var searchTerm: String = ""
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
                TextField("Search", text: $searchTerm, onEditingChanged: onEditChanges, onCommit: onCommit)
                    .frame(height: 50.0, alignment: Alignment.topLeading)
                    .foregroundColor(.red)
                    .cornerRadius(4)
                    .clipped()
                    .padding(EdgeInsets(top: 5.0, leading: 15.0, bottom: 0.0, trailing: 15.0))
                List {
                    ForEach(reducer.cellReducers) {
                        UserCellView(reducer: $0)
                            .frame(width: 100, height: 100)
                            .cornerRadius(8.0)
                    }
//                    UserCellReducer($0)
//                    ForEach(0..<reducer.$numberOfRows) { _ in
//                        HStack {
//                            ForEach(0..<3) { _ in
//                                UserCellView(reducer: )
//                                    .aspectRatio(1.0, contentMode: .fill)
//                                    .cornerRadius(8.0)
//                            }
//                        }
//                    }
                }.hidden()
            }
            .navigationBarTitle("Users", displayMode: .large)
        }
    }
}

struct UsersView_Previews: PreviewProvider {
    static var previews: some View {
        UsersView()
    }
}
