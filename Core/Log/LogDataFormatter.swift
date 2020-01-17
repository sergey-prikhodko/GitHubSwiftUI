//
//  LogDataFormatter.swift
//  Core
//
//  Created by Sergey Prikhodko on 17.01.2020.
//  Copyright © 2020 Sergey Prikhodko. All rights reserved.
//

import Foundation

extension DateFormatter {
    
    static var logDataFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .none
        formatter.timeStyle = .long
        
        return formatter
    }
}
