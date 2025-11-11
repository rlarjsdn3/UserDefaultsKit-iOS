# UserDefaultsWrapper-iOS

[![Version](https://img.shields.io/cocoapods/v/UserDefaultsWrapper.svg?style=flat)](https://cocoapods.org/pods/UserDefaultsWrapper)
[![License](https://img.shields.io/cocoapods/l/UserDefaultsWrapper.svg?style=flat)](https://cocoapods.org/pods/UserDefaultsWrapper)
[![Platform](https://img.shields.io/cocoapods/p/UserDefaultsWrapper.svg?style=flat)](https://cocoapods.org/pods/UserDefaultsWrapper)

## Overview

UserDefaultsWrapper is a library that helps you use UserDefaults in a more intuitive and safe way. It focuses on reducing human error and improving code readability.

The following list highlights the library’s key features:

* Key Definition and Default Values
    + Only pre-declared keys can be used in UserDefaults, preventing typos or invalid key usage.

* KeyPath-Based Access
    + Read, modify, and remove values in UserDefaults using key paths.

* Dynamic Member Lookup Support
    + Access declared keys quickly using dot (.) syntax.

* Parameter Pack Support
    + Read, modify, or remove multiple values at once.

* Property Wrapper Support
    + Manage values more concisely using property wrappers.

UserDefaultsWrapper will continue to receive updates. Your ⭐️ stars, issue reports, and contributions are greatly appreciated and help the project grow!


## Basic Usages

#### 키 정의

To add or modify values using UserDefaultsWrapper, you must first define a key.
Keys are declared as computed properties of type `UserDefaultsKey` within an extension of `UserDefaultsWrapperKeys`.

When creating a `UserDefaultsKey` instance, you need to provide two parameters: the key string used in UserDefaults (name) and the default value (default) that will be returned when no value exists for that key. In other words, if the specified key doesn’t have a value in UserDefaults, the predefined default value will be automatically returned.

```swift
extension UserDefaultsWraperKeys {

    var username: UserDefaultsKey<String?> {
        UserDefaultsKey<Bool>(name: "username", default: nil)
    }

    var yearOfBirth: UserDefaultsKey<Int> {
        UserDefaultsKey<Bool>(name: "yearOfBirth", default: 1998)
    }
}
```

> **Note:** UserDefaultsWrapper can only store types that conform to the `Codable` protocol.


#### 값 읽기

Reading values from UserDefaultsWrapper is very straightforward. The library supports three main approaches:

1. Standard Method Call

2. Dynamic Member Lookup
    
3. Property Wrapper

```swift
// ① Standard Method
UserDefaultsWrapper.shared.get(forKey: \.username)

// ② Dynamic Member Lookup
UserDefaultsWrapper.shared.username

// ③ Property Wrapper
@UserDefaultsValue(\.hasSeenOnboarding) var username: Bool
```

In addition, by leveraging Parameter Pack functionality, you can retrieve multiple values of different types in a single method call:

```swift
let (username, yearOfBirth) = UserDefaultsWrapperKey.shared.get(forKey: \.username, \.yearOfBirth)
```


#### 값 수정 

Modifying values in UserDefaultsWrapper is just as simple. The library supports three main approaches:

1. Standard Method Call

2. Dynamic Member Lookup
    
3. Property Wrapper

```swift
// ① Standard Method
UserDefaultsWrapper.shared.set("KIM SOWOL", forKey: \.username)

// ② Dynamic Member Lookup
UserDefaultsWrapper.shared.username = "KIM SOWOL"

// ③ Property Wrapper
@UserDefaultsValue(\.username) var username: Bool
username = "KIM SOWOL"
```

Additionally, by utilizing Parameter Pack functionality, you can modify multiple values of different types in a single method call:

```swift
UserDefaultsWrapperKey.shared.set("KIM SOWOL", 1998, forKey: \.username, \.yearOfBirth)
```


#### 값 삭제

Deleting values in UserDefaultsWrapper is also simple. You can remove stored values in three different ways:

```swift
// ① Assign nil to delete the value
UserDefaultsWrapper.shared.set(nil, forKey: \.username)

// ② Use the remove(forKey:) method
UserDefaultsWrapper.shared.remove(\.username)

// ③ Use the projected value of the Property Wrapper
@UserDefaultsValue(\.username) var username: String
$username.remove()
```


## Requirements

iOS 15.0+ | iPadOS 15.0+

## Installation

### CocoaPods

UserDefaultsWrapper is available through [CocoaPods](https://cocoapods.org). To install it, simply add the following line to your Podfile:

```ruby
pod 'UserDefaultsWrapper'
```


### Swift Package Manager

UserDefaultsWrapper can be easily installed via Swift Package Manager (SPM).

#### Installation via Xcode

1. In Xcode, go to File > Add Packages…

2. Enter the following URL in the search field:
    
```
https://github.com/rlarjsdn3/UserDefaultsWrapper.git
```

3. Select the desired version and click Add Package.

#### Installation via Package.swift

Add the following line to the dependencies section of your Package.swift file:

```swift
dependencies: [
    .package(url: "https://github.com/rlarjsdn3/UserDefaultsWrapper.git", from: "1.0.0")
]
```


## Author

rlarjsdn3, rlarjsdn3@naver.com

## License

UserDefaultsWrapper is available under the MIT license. See the LICENSE file for more info.
