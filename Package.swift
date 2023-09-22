// swift-tools-version:5.6
import PackageDescription // Import the PackageDescription module

let package = Package( // Define a new package
    name: "UserDefaultSugar", // Set the package name to "UserDefaultSugar"
    platforms: [.iOS(.v15), .macOS(.v12)], // Set the supported platforms to iOS 15 and macOS 12
    products: [ // Define the products of the package
        .library( // Define a new library product
            name: "UserDefaultSugar", // Set the library name to "UserDefaultSugar"
            targets: ["UserDefaultSugar"]) // Set the library target to "UserDefaultSugar"
    ],
    dependencies: [], // Set the package dependencies to an empty array
    targets: [ // Define the targets of the package
        .target( // Define a new target
            name: "UserDefaultSugar", // Set the target name to "UserDefaultSugar"
            dependencies: []) // Set the target dependencies to an empty array
    ]
)