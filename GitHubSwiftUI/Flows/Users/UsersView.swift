//
//  UsersView.swift
//  GitHubSwiftUI
//
//  Created by Sergey Prikhodko on 14.01.2020.
//  Copyright © 2020 Sergey Prikhodko. All rights reserved.
//

import SwiftUI
import Combine

struct UsersView: View {
    
    @State private var searchTerm: String = ""
    
    private let onEditChanges: (Bool) -> Void = {
        debugPrint("on edit: \($0)")
    }
    private let onCommit: () -> Void = {
        debugPrint("on commit")
    }
    
    private let cellReducer = UserCellReducer(
        GitHubUser(
            id: "id",
            firstName: "Sergey",
            lastName: "Prikhodko",
            imageURL: URL(string: "https://i7.pngguru.com/preview/662/295/721/programmer-computer-programming-laptop-professional-architectural-engineer-vector-material.jpg")!
        )
    )
    
    var body: some View {
        NavigationView {
            VStack {
                TextField("Search", text: $searchTerm, onEditingChanged: onEditChanges, onCommit: onCommit)
                    .frame(height: 50.0, alignment: Alignment.topLeading)
                    .foregroundColor(.red)
                    .cornerRadius(4)
                    .clipped()
                List {
                    ForEach(0..<8) { _ in
                        HStack {
                            ForEach(0..<3) { _ in
                                UserCellView(reducer: self.cellReducer)
                                    .aspectRatio(1.0, contentMode: .fill)
                                    .cornerRadius(8.0)
                            }
                        }
                    }
                }
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
