// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "LBDependency",
    platforms: [
        .iOS(.v13)  // <- version minimale d’iOS ici
    ],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "LBDependency",
            targets: ["LBDependency"]),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "LBDependency"),
        .testTarget(
            name: "LBDependencyTests",
            dependencies: ["LBDependency"]
        ),
    ]
)
