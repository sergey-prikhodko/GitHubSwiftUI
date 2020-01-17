//
//  ResponseModel.swift
//  DevaliAppPrototype
//
//  Created by Sergey Prikhodko on 9/16/18.
//  Copyright © 2018 Sergey Prikhodko. All rights reserved.
//

import Foundation

public final class ResponseModel<T> {
    
    var response: T?
    var error: Error?
    
    init(response: T? = nil, error: Error? = nil) {
        self.response = response
        self.error = error
    }
    
    convenience init(_ response: T) {
        self.init()
        self.response = response
    }
    
    convenience init(_ error: Error) {
        self.init()
        self.error = error
    }
    
}
