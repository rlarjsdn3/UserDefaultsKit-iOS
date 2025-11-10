//
//  UserDefaultsWrapper+PropertyWrapper_Tests.swift
//  UserDefaultsWrapper_Tests
//
//  Created by 김건우 on 11/3/25.
//  Copyright © 2025 CocoaPods. All rights reserved.
//

import Testing
@testable import UserDefaultsWrapper

@Suite(.serialized)
final class UserDefaultsWrapper_PropertyWrapper_Tests {
    
    private var sut: UserDefaultsWrapper!
    
    init() {
        sut = UserDefaultsWrapper(suiteName: "com.test.UserDefaultsWrapper_PropertyWrapper_Tests")
    }
    
    deinit {
        sut.removeAll()
    }
    
    @Test
    func test_WhenGetValueFromPropertyWrapper_ThenReturnDefaultValue() {
        @UserDefaultsValue(\.intValue, store: sut) var intValue: Int
        #expect(intValue == 0)
    }
    
    @Test
    func test_WhenGetValueFromPropertyWrapperAndSetNewValue_ThenReturnNewValue() {
        @UserDefaultsValue(\.intValue, store: sut) var intValue: Int
        intValue = 100
        #expect(intValue == 100)
    }
    
    @Test
    func test_WhenRemoveValueFromPropertyWrapper_ThenClearValue() {
        @UserDefaultsValue(\.intValue, store: sut) var intValue: Int
        intValue = 100
        
        $intValue.remove()
        #expect(intValue == 0)
    }
}
