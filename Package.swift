// swift-tools-version:5.6
import PackageDescription

let package = Package(
    name: "UserDefaultSugar",
    platforms: [.iOS(.v15), .macOS(.v12)],
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
