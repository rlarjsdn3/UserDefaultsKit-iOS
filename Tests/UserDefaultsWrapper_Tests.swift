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

    @Test
    func test_WhenRemoveAll_ThenClearAllData() {
        let sut = UserDefaultsWrapper(suiteName: "com.UserDefaultsWrapper.Tests")
        defer { sut.removeAll() }
        
        sut.intValue = 100
        sut.floatValue = 2.18
        sut.doubleValue = 3.14
        sut.stringValue = "12.34"
        sut.boolValue = false
        sut.codableValue = CodableResponse(name: "")
        
        sut.removeAll()
        #expect(sut.intValue == 0)
        #expect(sut.floatValue == 0.0)
        #expect(sut.doubleValue == 0.0)
        #expect(sut.stringValue == "none")
        #expect(sut.boolValue == true)
        #expect(sut.codableValue == nil)
    }
    
    @Suite(.serialized)
    struct UserDefaultsWrapper_IntTests {
        
        @Test
        func test_WhenGetValue_ThenReturnDefaultValue() {
            let sut = UserDefaultsWrapper(suiteName: "com.UserDefaultsWrapper.IntTests")
            defer { sut.removeAll() }
            #expect(sut.intValue == 0)
        }
        
        @Test
        func test_WhenGetValueAndSetNewValue_ThenReturnNewValue() {
            let sut = UserDefaultsWrapper(suiteName: "com.UserDefaultsWrapper.IntTests")
            defer { sut.removeAll() }
            
            // Set new value using `set` method.
            sut.set(123, forKey: \.intValue)
            #expect(sut.intValue == 123)
            #expect(sut.get(forKey: \.intValue) == 123)
            
            // Set new value using dynamic member look up.
            sut.intValue = 456
            #expect(sut.intValue == 456)
            #expect(sut.get(forKey: \.intValue) == 456)
        }
        
        @Test
        func test_WhenRemoveIntValue_ThenClearIntValue() {
            let sut = UserDefaultsWrapper(suiteName: "com.UserDefaultsWrapper.IntTests")
            defer { sut.removeAll() }
            sut.intValue = 1_000
            
            sut.remove(forKey: \.intValue)
            #expect(sut.intValue == 0)
        }
        
        @Test
        func test_WhenSetIntValueWithNil_ThenClearIntValue() {
            let sut = UserDefaultsWrapper(suiteName: "com.UserDefaultsWrapper.IntTests")
            defer { sut.removeAll() }
            sut.intValue = 1_000
            
            sut.set(nil, forKey: \.intValue)
            #expect(sut.intValue == 0)
        }
    }
    
    
    @Suite(.serialized)
    struct UserDefaultsWrapper_FloatTests {
        
        @Test
        func test_WhenGetValue_ThenReturnDefaultValue() {
            let sut = UserDefaultsWrapper(suiteName: "com.UserDefaultsWrapper.FloatTests")
            defer { sut.removeAll() }
            #expect(sut.floatValue == 0.0)
        }
        
        @Test
        func test_WhenGetValueAndSetNewValue_ThenReturnNewValue() {
            let sut = UserDefaultsWrapper(suiteName: "com.UserDefaultsWrapper.FloatTests")
            defer { sut.removeAll() }
            
            // Set new value using `set` method.
            sut.set(123.0, forKey: \.floatValue)
            #expect(sut.floatValue == 123.0)
            #expect(sut.get(forKey: \.floatValue) == 123.0)
            
            // Set new value using dynamic member look up.
            sut.floatValue = 456.0
            #expect(sut.floatValue == 456.0)
            #expect(sut.get(forKey: \.floatValue) == 456.0)
        }
        
        @Test
        func test_WhenRemoveFloatValue_ThenClearFloatValue() {
            let sut = UserDefaultsWrapper(suiteName: "com.UserDefaultsWrapper.FloatTests")
            defer { sut.removeAll() }
            sut.floatValue = 1_000.0
            
            sut.remove(forKey: \.floatValue)
            #expect(sut.floatValue == 0)
        }
        
        @Test
        func test_WhenSetFloatValueWithNil_ThenClearFloatValue() {
            let sut = UserDefaultsWrapper(suiteName: "com.UserDefaultsWrapper.FloatTests")
            defer { sut.removeAll() }
            sut.floatValue = 1_000.0
            
            sut.set(nil, forKey: \.floatValue)
            #expect(sut.floatValue == 0)
        }
    }
    
    
    @Suite(.serialized)
    struct UserDefaultsWrapper_DoubleTests {
        
        @Test
        func test_WhenGetValue_ThenReturnDefaultValue() {
            let sut = UserDefaultsWrapper(suiteName: "com.UserDefaultsWrapper.DoubleTests")
            defer { sut.removeAll() }
            #expect(sut.doubleValue == 0.0)
        }
        
        @Test
        func test_WhenGetValueAndSetNewValue_ThenReturnNewValue() {
            let sut = UserDefaultsWrapper(suiteName: "com.UserDefaultsWrapper.DoubleTests")
            defer { sut.removeAll() }
            
            // Set new value using `set` method.
            sut.set(123.0, forKey: \.doubleValue)
            #expect(sut.doubleValue == 123.0)
            #expect(sut.get(forKey: \.doubleValue) == 123.0)
            
            // Set new value using dynamic member look up.
            sut.doubleValue = 456.0
            #expect(sut.doubleValue == 456.0)
            #expect(sut.get(forKey: \.doubleValue) == 456.0)
        }
        
        @Test
        func test_WhenRemoveDoubleValue_ThenClearDoubleValue() {
            let sut = UserDefaultsWrapper(suiteName: "com.UserDefaultsWrapper.DoubleTests")
            defer { sut.removeAll() }
            sut.doubleValue = 1_000.0
            
            sut.remove(forKey: \.doubleValue)
            #expect(sut.doubleValue == 0.0)
        }
        
        @Test
        func test_WhenSetDoubleValueWithNil_ThenClearDoubleValue() {
            let sut = UserDefaultsWrapper(suiteName: "com.UserDefaultsWrapper.DobleTests")
            defer { sut.removeAll() }
            sut.doubleValue = 1_000.0
            
            sut.set(nil, forKey: \.doubleValue)
            #expect(sut.doubleValue == 0.0)
        }
    }
    
    
    @Suite(.serialized)
    struct UserDefaultsWrapper_StringTests {
        
        @Test
        func test_WhenGetValue_ThenReturnDefaultValue() {
            let sut = UserDefaultsWrapper(suiteName: "com.UserDefaultsWrapper.StringTests")
            defer { sut.removeAll() }
            #expect(sut.stringValue == "none")
        }
        
        @Test
        func test_WhenGetValueAndSetNewValue_ThenReturnNewValue() {
            let sut = UserDefaultsWrapper(suiteName: "com.UserDefaultsWrapper.StringTests")
            defer { sut.removeAll() }
            
            // Set new value using `set` method.
            sut.set("12.34", forKey: \.stringValue)
            #expect(sut.stringValue == "12.34")
            #expect(sut.get(forKey: \.stringValue) == "12.34")
            
            // Set new value using dynamic member look up.
            sut.stringValue = "4.56"
            #expect(sut.stringValue == "4.56")
            #expect(sut.get(forKey: \.stringValue) == "4.56")
        }
        
        @Test
        func test_WhenRemoveStringValue_ThenClearStringValue() {
            let sut = UserDefaultsWrapper(suiteName: "com.UserDefaultsWrapper.StringTests")
            defer { sut.removeAll() }
            sut.stringValue = "12.34"
            
            sut.remove(forKey: \.stringValue)
            #expect(sut.stringValue == "none")
        }
        
        @Test
        func test_WhenSetIntValueWithNil_ThenClearIntValue() {
            let sut = UserDefaultsWrapper(suiteName: "com.UserDefaultsWrapper.StringTests")
            defer { sut.removeAll() }
            sut.stringValue = "12.34"
            
            sut.set(nil, forKey: \.stringValue)
            #expect(sut.stringValue == "none")
        }
    }
    
    
    @Suite(.serialized)
    struct UserDefaultsWrapper_BoolTests {
        
        @Test
        func test_WhenGetValue_ThenReturnDefaultValue() {
            let sut = UserDefaultsWrapper(suiteName: "com.UserDefaultsWrapper.BoolTests")
            defer { sut.removeAll() }
            #expect(sut.boolValue == true)
        }
        
        @Test
        func test_WhenGetValueAndSetNewValue_ThenReturnNewValue() {
            let sut = UserDefaultsWrapper(suiteName: "com.UserDefaultsWrapper.BoolTests")
            defer { sut.removeAll() }
            
            // Set new value using `set` method.
            sut.set(false, forKey: \.boolValue)
            #expect(sut.boolValue == false)
            #expect(sut.get(forKey: \.boolValue) == false)
            
            // Set new value using dynamic member look up.
            sut.boolValue = true
            #expect(sut.boolValue == true)
            #expect(sut.get(forKey: \.boolValue) == true)
        }
        
        @Test
        func test_WhenRemoveIntValue_ThenClearIntValue() {
            let sut = UserDefaultsWrapper(suiteName: "com.UserDefaultsWrapper.BoolTests")
            defer { sut.removeAll() }
            sut.boolValue = false
            
            sut.remove(forKey: \.boolValue)
            #expect(sut.boolValue == true)
        }
        
        @Test
        func test_WhenSetIntValueWithNil_ThenClearIntValue() {
            let sut = UserDefaultsWrapper(suiteName: "com.UserDefaultsWrapper.BoolTests")
            defer { sut.removeAll() }
            sut.boolValue = false
            
            sut.set(nil, forKey: \.boolValue)
            #expect(sut.boolValue == true)
        }
    }
    
    
    @Suite(.serialized)
    struct UserDefaultsWrapper_CodableTests {
        
        @Test
        func test_WhenGetValue_ThenReturnDefaultValue() {
            let sut = UserDefaultsWrapper(suiteName: "com.UserDefaultsWrapper.CodableTests")
            defer { sut.removeAll() }
            #expect(sut.codableValue == nil)
        }
        
        @Test
        func test_WhenGetValueAndSetNewValue_ThenReturnNewValue() {
            let sut = UserDefaultsWrapper(suiteName: "com.UserDefaultsWrapper.CodableTests")
            defer { sut.removeAll() }
            
            let codableValue1 = CodableResponse(name: "Codable_1")
            let codableValue2 = CodableResponse(name: "Codable_2")
            
            // Set new value using `set` method.
            sut.set(codableValue1, forKey: \.codableValue)
            #expect(sut.codableValue == codableValue1)
            #expect(sut.get(forKey: \.codableValue) == codableValue1)
            
            // Set new value using dynamic member look up.
            sut.codableValue = codableValue2
            #expect(sut.codableValue == codableValue2)
            #expect(sut.get(forKey: \.codableValue) == codableValue2)
        }
        
        @Test
        func test_WhenRemoveIntValue_ThenClearIntValue() {
            let sut = UserDefaultsWrapper(suiteName: "com.UserDefaultsWrapper.CodableTests")
            defer { sut.removeAll() }
            sut.intValue = 1_000
            
            sut.remove(forKey: \.intValue)
            #expect(sut.intValue == 0)
        }
        
        @Test
        func test_WhenSetIntValueWithNil_ThenClearIntValue() {
            let sut = UserDefaultsWrapper(suiteName: "com.UserDefaultsWrapper.CodableTests")
            defer { sut.removeAll() }
            sut.intValue = 1_000
            
            sut.set(nil, forKey: \.intValue)
            #expect(sut.intValue == 0)
        }
    }
    
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
        UserDefaultsWrapperKey(name: "StringValue", default: "none")
    }
    
    var boolValue: UserDefaultsWrapperKey<Bool> {
        UserDefaultsWrapperKey(name: "BoolValue", default: true)
    }
    
    var codableValue: UserDefaultsWrapperKey<CodableResponse?> {
        UserDefaultsWrapperKey(name: "CodableValue", default: nil)
    }
}
