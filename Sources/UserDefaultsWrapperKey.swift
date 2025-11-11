//
//  UserDefaultsWrapperKey.swift
//  Pods-UserDefaultsWrapper_Tests
//
//  Created by 김건우 on 11/1/25.
//

import Foundation

/// A type-safe key definition used by `UserDefaultsWrapper`.
///
/// Each key defines a unique name and its corresponding default value.
public struct UserDefaultsWrapperKey<Value> {

    /// The unique name associated with this key.
    public let name: String

    /// The default value returned when no stored value is found.
    public let `default`: Value

    /// Creates a new instance of `UserDefaultsWrapperKey`.
    ///
    /// - Parameters:
    ///   - name: The unique name of the key.
    ///   - default: The default value to return if no value exists for this key.
    public init(name: String, default: Value) {
        self.name = name
        self.default = `default`
    }
}
