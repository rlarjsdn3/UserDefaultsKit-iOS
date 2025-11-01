//
//  UserDefaultsWrapper_Tests.swift
//  UserDefaultsWrapper_Tests
//
//  Created by 김건우 on 11/1/25.
//  Copyright © 2025 CocoaPods. All rights reserved.
//

import Testing
@testable import UserDefaultsWrapper

final class UserDefaultsWrapper_Tests {
}

fileprivate extension UserDefaultsWrapperKeys {
    
    var intValue: UserDefaultsWrapperKey<Int> {
        UserDefaultsWrapperKey(name: "IntValue", default: 0)
    }
    
    var floatValue: UserDefaultsWrapperKey<Float> {
        UserDefaultsWrapperKey(name: "FloatValue", default: 0.0)
    }
    
    var doubleValue: UserDefaultsWrapperKey<Double> {
        UserDefaultsWrapperKey(name: "DoubleValue", default: 0.0)
    }
    
    var stringValue: UserDefaultsWrapperKey<String> {
        UserDefaultsWrapperKey(name: "StringValue", default: "default")
    }
    
    var boolValue: UserDefaultsWrapperKey<Bool> {
        UserDefaultsWrapperKey(name: "BoolValue", default: true)
    }
    
    var mockValue: UserDefaultsWrapperKey<MockResponse?> {
        UserDefaultsWrapperKey(name: "MockValue", default: nil)
    }
}
