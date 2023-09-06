// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "FB13094487PackageProductNotFound",
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "FB13094487PackageProductNotFound",
            targets: ["FB13094487PackageProductNotFound"]),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "FB13094487PackageProductNotFound"),
        .testTarget(
            name: "FB13094487PackageProductNotFound.Tests",
            dependencies: ["FB13094487PackageProductNotFound"]),
    ]
)
