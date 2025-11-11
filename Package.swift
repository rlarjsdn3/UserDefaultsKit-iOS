// swift-tools-version:5.9
// The swift-tools-version eclares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "UserDefaultsWrapper",
    platforms: [
        .iOS(.v15)
    ],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "UserDefaultsWrapper",
            targets: ["UserDefaultsWrapper"]
        )
    ],
    dependencies: [
    ],
    targets: [
        .target(
            name: "UserDefaultsWrapper",
            dependencies: [],
            path: "Sources"
        ),
        .testTarget(
            name: "UserDefaultsWrapper-Tests",
            dependencies: ["UserDefaultsWrapper"],
            path: "Tests"
        )
    ],
    swiftLanguageVersions: [.v5]
)
