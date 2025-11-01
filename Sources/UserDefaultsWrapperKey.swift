//
//  UserDefaultsWrapperKey.swift
//  Pods-UserDefaultsWrapper_Tests
//
//  Created by 김건우 on 11/1/25.
//

import Foundation

///
public struct UserDefaultsWrapperKey<Value> {
   
    ///
    public let name: String
    
    ///
    public let `default`: Value
    
    ///
    public init(name: String, default: Value) {
        self.name = name
        self.default = `default`
    }
}
