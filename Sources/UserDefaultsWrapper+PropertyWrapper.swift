//
//  UserDefaultsWrapper+PropertyWrapper.swift
//  Pods
//
//  Created by 김건우 on 11/3/25.
//

import Foundation

///
@propertyWrapper
public struct AppStorage<Value> where Value: Codable {
    
    let store: UserDefaultsWrapper
    let keyPath: KeyPath<UserDefaultsWrapperKeys, UserDefaultsWrapperKey<Value>>
    
    public init(
        _ keyPath: KeyPath<UserDefaultsWrapperKeys, UserDefaultsWrapperKey<Value>>,
        store: UserDefaultsWrapper? = nil
    ) {
        self.keyPath = keyPath
        self.store = store ?? .shared
    }
    
    public init(
        wrappedValue: Value,
        _ keyPath: KeyPath<UserDefaultsWrapperKeys, UserDefaultsWrapperKey<Value>>,
        store: UserDefaultsWrapper? = nil
    ) {
        self.keyPath = keyPath
        self.store = store ?? .shared
        self.wrappedValue = wrappedValue
    }
    
    ///
    public var wrappedValue: Value {
        get { store.get(forKey: keyPath) }
        set { store.set(newValue, forKey: keyPath) }
    }
}
