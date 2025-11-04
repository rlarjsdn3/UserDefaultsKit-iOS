//
//  UserDefaultsWrapper.swift
//  Pods-UserDefaultsWrapper_Tests
//
//  Created by 김건우 on 11/1/25.
//

import Foundation

/// A lightweight, thread-safe wrapper around `UserDefaults`.
///
/// Provides type-safe access and convenient key management using `@dynamicMemberLookup`.
@dynamicMemberLookup
final public class UserDefaultsWrapper: @unchecked Sendable {
    
    // MARK: - Shared
    
    /// A shared singleton instance of `UserDefaultsWrapper`.
    ///
    /// Use this instance when you need a default, globally accessible wrapper.
    public static let shared = UserDefaultsWrapper()
    
    // MARK: - Initializer

    /// Creates a `UserDefaultsWrapper` instance using the standard `UserDefaults`.
    private init() {
        userDefaults = UserDefaults()
    }

    /// Creates a `UserDefaultsWrapper` instance for the specified app group or suite.
    ///
    /// - Parameter suiteName: The name of the suite to use for shared `UserDefaults` access.
    ///
    /// Use this initializer when you want to share data across multiple targets or extensions.
    public init(suiteName: String) {
        userDefaults = UserDefaults(suiteName: suiteName)
    }
    
    
    // MARK: - Properties
    
    private let userDefaults: UserDefaults!
    
    
    // MARK: - Get
    
    /// Retrieves a stored value from `UserDefaults` for the specified key path.
    ///
    /// - Parameter keyPath: A key path that points to a specific `UserDefaultsWrapperKey` defined in `UserDefaultsWrapperKeys`.
    /// - Returns: The stored value associated with the given key, or the key’s default value if none is found.
    ///
    /// The generic `Value` type must conform to `Codable`.
    public func get<Value>(forKey keyPath: KeyPath<UserDefaultsWrapperKeys, UserDefaultsWrapperKey<Value>>) -> Value where Value: Codable {
        let key = UserDefaultsWrapperKeys()[keyPath: keyPath]
        return get(forKey: key.name) ?? key.default
    }
    
    private func get<Value>(forKey key: String) -> Value? where Value: Codable {
        guard
            let data = userDefaults.object(forKey: key) as? Data,
            let decoded = try? JSONDecoder().decode(Value.self, from: data)
        else { return nil }
        return decoded
    }
    
    
    // MARK: - Set
    
    /// Stores a value in `UserDefaults` for the specified key path.
    ///
    /// - Parameters:
    ///   - value: The value to store. Pass `nil` to remove any existing value for the key.
    ///   - keyPath: A key path that points to a specific `UserDefaultsWrapperKey` defined in `UserDefaultsWrapperKeys`.
    ///
    /// The generic `Value` type must conform to `Codable`.
    public func set<Value>(
        _ value: Value?,
        forKey keyPath: KeyPath<UserDefaultsWrapperKeys, UserDefaultsWrapperKey<Value>>,
    ) where Value: Codable {
        let key = UserDefaultsWrapperKeys()[keyPath: keyPath]
        set(value, forKey: key.name)
    }
    
    private func set<Value>(
        _ value: Value?,
        forKey key: String
    ) where Value: Codable {
        guard let encoded = try? JSONEncoder().encode(value)
        else { return }
        userDefaults.set(encoded, forKey: key)
    }
    
    
    // MARK: - Remove
    
    /// Removes the value associated with the specified key path.
    ///
    /// - Parameter keyPath: A key path that points to a specific `UserDefaultsWrapperKey` defined in `UserDefaultsWrapperKeys`.
    ///
    /// This method is a type-safe way to remove stored values.
    public func remove<Value>(forKey keyPath: KeyPath<UserDefaultsWrapperKeys, UserDefaultsWrapperKey<Value>>) {
        let key = UserDefaultsWrapperKeys()[keyPath: keyPath]
        remove(forKey: key.name)
    }
    
    private func remove(forKey key: String) {
        userDefaults.removeObject(forKey: key)
    }
    
    /// Removes all stored values from the current `UserDefaults` suite.
    ///
    /// - Warning: This action deletes **all** keys and values within the suite and cannot be undone.
    /// Useful for resetting user defaults, such as during testing or logout operations.
    public func removeAll() {
        let dict = userDefaults.dictionaryRepresentation()
        dict.keys.forEach { key in remove(forKey: key) }
    }
}

extension UserDefaultsWrapper {
    
    public subscript<Value>(dynamicMember keyPath: KeyPath<UserDefaultsWrapperKeys, UserDefaultsWrapperKey<Value>>) -> Value where Value: Codable {
        get { get(forKey: keyPath) }
        set { set(newValue, forKey: keyPath) }
    }
}
