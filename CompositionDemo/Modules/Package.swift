// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Modules",
    platforms: [.iOS(.v15)],
    products: [
        .library(name: "LoginFeature", targets: ["LoginFeature"]),
        .library(name: "Networking", targets: ["Networking"]),
        .library(name: "Core", targets: ["Core"]),
        .library(name: "Security", targets: ["Security"]),
    ],
    dependencies: [],
    targets: [
        .target(name: "LoginFeature", path: "Sources/LoginFeature/Sources"),
        .target(name: "Networking", path: "Sources/Networking/Sources"),
        .target(name: "Core", path: "Sources/Core/Sources"),
        .target(name: "Security", path: "Sources/Security/Sources")
    ]
)
