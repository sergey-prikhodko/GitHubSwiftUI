//
//  UserCellView.swift
//  GitHubSwiftUI
//
//  Created by Sergey Prikhodko on 15.01.2020.
//  Copyright © 2020 Sergey Prikhodko. All rights reserved.
//

import SwiftUI
import Core

struct UserCellView: View {
    
    @ObservedObject var reducer: UserCellReducer
    
    var body: some View {
        ZStack {
            Color(UIColor.secondarySystemBackground)
            NavigationLink(destination: reducer.detailedLink) {
                HStack {
                    reducer.image
                        .resizable()
                        .scaledToFit()
                        .clipShape(Circle())
                        .overlay(
                            Circle()
                                .stroke(Color(UIColor.tertiarySystemBackground),
                                        lineWidth: 4.0)
                        )
                        .shadow(radius: 10.0)
                    Spacer()
                    Text(reducer.initials)
                        .font(.title)
                        .foregroundColor(Color(UIColor.label))
                        .multilineTextAlignment(.trailing)
                        .lineLimit(nil)
                }
            }
            .padding()
        }
    }
}

struct UserCellView_Previews: PreviewProvider {
    static var previews: some View {
        UserCellView(reducer: UserCellReducer(GitHubUser.sergey))
            .previewLayout(.fixed(width: 375, height: 70))
    }
}
