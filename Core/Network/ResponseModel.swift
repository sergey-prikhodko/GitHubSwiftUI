//
//  ResponseModel.swift
//  DevaliAppPrototype
//
//  Created by Sergey Prikhodko on 9/16/18.
//  Copyright © 2018 Sergey Prikhodko. All rights reserved.
//

import Foundation

public final class ResponseModel<T> {
    
    public var value: T?
    public var error: Error?
    
    init(value: T? = nil, error: Error? = nil) {
        self.value = value
        self.error = error
    }
    
    convenience init(_ value: T) {
        self.init()
        self.value = value
    }
    
    convenience init(_ error: Error) {
        self.init()
        self.error = error
    }
}
