// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "MVVMCModule",
    platforms: [
        .iOS(.v16)
    ],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "MVVMCModule",
            targets: ["MVVMCModule"]),
    ],
    dependencies: [
        .package(url: "https://github.com/Swinject/Swinject.git", exact: "2.8.0")
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "MVVMCModule",
            dependencies: [
                .product(name: "Swinject", package: "Swinject")
            ]
        ),
        .testTarget(
            name: "MVVMCModuleTests",
            dependencies: ["MVVMCModule"]),
    ]
)
