//
//  UserDefaultsWrapperKeys.swift
//  Pods-UserDefaultsWrapper_Tests
//
//  Created by 김건우 on 11/1/25.
//

import Foundation

/// A container for defining all keys used with `UserDefaultsWrapper`.
///
/// Extend this structure to declare custom keys and their default values.
///
/// Example:
/// ```swift
/// var hasSeenOnboarding: UserDefaultsWrapperKey<Bool> {
///     UserDefaultsWrapperKey(
///         name: "hasSeenOnboarding",
///         default: false
///     )
/// }
/// ```
public struct UserDefaultsWrapperKeys { }
