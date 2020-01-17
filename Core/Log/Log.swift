//
//  Log.swift
//  Core
//
//  Created by Sergey Prikhodko on 17.01.2020.
//  Copyright © 2020 Sergey Prikhodko. All rights reserved.
//

import Foundation


public func log<T: StringProtocol>(_ string: T) {
    #if DEBUG
    
    let resultString = "[\(DateFormatter.logDataFormatter.string(from: Date()))] \(string)"
    print(resultString)
    
    #endif
}
