//
//  UserCellView.swift
//  GitHubSwiftUI
//
//  Created by Sergey Prikhodko on 15.01.2020.
//  Copyright © 2020 Sergey Prikhodko. All rights reserved.
//

import SwiftUI

struct UserCellView: View {
    
    @ObservedObject var reducer: UserCellReducer
    
    var body: some View {
        ZStack {
            Color.red
            Text(reducer.initials)
            reducer.image.resizable().scaledToFit().animation(.easeInOut)
        }
    }
}

struct UserCellView_Previews: PreviewProvider {
    static var previews: some View {
        EmptyView()
    }
}
