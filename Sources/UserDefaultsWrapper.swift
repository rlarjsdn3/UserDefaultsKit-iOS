//
//  UserDefaultsWrapper.swift
//  Pods-UserDefaultsWrapper_Tests
//
//  Created by 김건우 on 11/1/25.
//

import Foundation

///
@dynamicMemberLookup
final public class UserDefaultsWrapper: @unchecked Sendable {
    
    // MARK: - Shared
    
    ///
    public static let shared = UserDefaultsWrapper()
    
    
    // MARK: - Intializer
    
    ///
    private init() {
        userDefaults = UserDefaults()
    }
    
    ///
    public init(suiteName: String) {
        userDefaults = UserDefaults(suiteName: suiteName)
    }
    
    
    // MARK: - Properties
    
    ///
    private let userDefaults: UserDefaults!
    
    
    // MARK: - Get
    
    ///
    public func get<Value>(forKey keyPath: KeyPath<UserDefaultsWrapperKeys, UserDefaultsWrapperKey<Value>>) -> Value where Value: Codable {
        let key = UserDefaultsWrapperKeys()[keyPath: keyPath]
        return get(forKey: key.name) ?? key.default
    }
    
    ///
    public func get<Value>(forKey key: String) -> Value? where Value: Codable {
        guard
            let data = userDefaults.object(forKey: key) as? Data,
            let decoded = try? JSONDecoder().decode(Value.self, from: data)
        else { return nil }
        return decoded
    }
    
    
    // MARK: - Set
    
    ///
    public func set<Value>(
        _ value: Value?,
        forKey keyPath: KeyPath<UserDefaultsWrapperKeys, UserDefaultsWrapperKey<Value>>,
    ) where Value: Codable {
        let key = UserDefaultsWrapperKeys()[keyPath: keyPath]
        set(value, forKey: key.name)
    }
    
    ///
    public func set<Value>(
        _ value: Value?,
        forKey key: String
    ) where Value: Codable {
        guard let encoded = try? JSONEncoder().encode(value)
        else { return }
        userDefaults.set(encoded, forKey: key)
    }
    
    
    // MARK: - Remove
    
    ///
    public func remove<Value>(forKey keyPath: KeyPath<UserDefaultsWrapperKeys, UserDefaultsWrapperKey<Value>>) {
        let key = UserDefaultsWrapperKeys()[keyPath: keyPath]
        remove(forKey: key.name)
    }
    
    ///
    public func remove(forKey key: String) {
        userDefaults.removeObject(forKey: key)
    }
    
    ///
    public func removeAll() {
        let dict = userDefaults.dictionaryRepresentation()
        dict.keys.forEach { key in remove(forKey: key) }
    }
}

extension UserDefaultsWrapper {
    
    ///
    public subscript<Value>(dynamicMember keyPath: KeyPath<UserDefaultsWrapperKeys, UserDefaultsWrapperKey<Value>>) -> Value where Value: Codable {
        get { get(forKey: keyPath) }
        set { set(newValue, forKey: keyPath) }
    }
}
