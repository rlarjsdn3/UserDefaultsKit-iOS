//
//  UserDefaultsWrapper+PropertyWrapper.swift
//  Pods
//
//  Created by 김건우 on 11/3/25.
//

import Foundation

/// A property wrapper that provides convenient access to values stored in `UserDefaultsWrapper`.
///
/// It allows reading, writing, and removing values associated with a predefined key.`
@propertyWrapper
public struct UserDefaultsValue<Value> where Value: Codable {
    
    private let store: UserDefaultsWrapper
    private let keyPath: KeyPath<UserDefaultsWrapperKeys, UserDefaultsWrapperKey<Value>>
    
    /// Initializes the property wrapper with a given key path and optional store.
    ///
    /// - Parameters:
    ///   - keyPath: The key path that identifies a predefined `UserDefaultsWrapperKey`.
    ///   - store: The `UserDefaultsWrapper` instance to use. Defaults to the shared instance.
    public init(
        _ keyPath: KeyPath<UserDefaultsWrapperKeys, UserDefaultsWrapperKey<Value>>,
        store: UserDefaultsWrapper? = nil
    ) {
        self.keyPath = keyPath
        self.store = store ?? .shared
    }
    
    /// The stored value for the specified key.
    /// Getting retrieves the value from `UserDefaults`, and setting updates it.
    public var wrappedValue: Value {
        get { store.get(forKey: keyPath) }
        set { store.set(newValue, forKey: keyPath) }
    }
    
    /// Provides access to the property wrapper instance itself.
    /// This can be used to call additional methods such as `remove()`.
    public var projectedValue: Self { self }
    
    /// Removes the stored value associated with the key from `UserDefaults`.
    public func remove() {
        store.remove(forKey: keyPath)
    }
}
