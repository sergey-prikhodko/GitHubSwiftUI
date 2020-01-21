//
//  TableViewSettings.swift
//  GitHubSwiftUI
//
//  Created by Sergey Prikhodko on 21.01.2020.
//  Copyright © 2020 Sergey Prikhodko. All rights reserved.
//

import UIKit

func commonSetupTableViewAppearance() {
    
    UITableViewCell.appearance().selectionStyle = .none
}

func setupTableViewAppearance() {
    
    // To remove only extra separators below the list:
    UITableView.appearance().tableFooterView = UIView()

    // To remove all separators including the actual ones:
    UITableView.appearance().separatorStyle = .none
}

func discardTableViewAppearance() {
    
    UITableView.appearance().tableFooterView = nil
    UITableView.appearance().separatorStyle = .singleLine
}
