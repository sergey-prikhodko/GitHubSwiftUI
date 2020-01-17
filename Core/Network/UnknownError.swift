//
//  UnknownError.swift
//  Core
//
//  Created by Sergey Prikhodko on 17.01.2020.
//  Copyright © 2020 Sergey Prikhodko. All rights reserved.
//

import Foundation

public struct UnknownError: Error {
    
    var localizedDescription: String {
        return "UnknownError"
    }
}
