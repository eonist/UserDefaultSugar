// swift-tools-version:5.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "UserDefaultSugar",
    platforms: [.iOS(.v12), .macOS(.v10_13)],
    products: [
        .library(
            name: "UserDefaultSugar",
            targets: ["UserDefaultSugar"])
    ],
    dependencies: [],
    targets: [
        .target(
            name: "UserDefaultSugar",
            dependencies: [])
    ]
)
