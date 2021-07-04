// swift-tools-version:5.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "MusicDoge",
    products: [
        .library(name: "MusicDoge", targets: ["MusicDoge"]),
    ],
    dependencies: [
        .package(url: "https://github.com/Alamofire/Alamofire.git", .upToNextMajor(from: "5.2.0")),
    ],
    targets: [
        .target(name: "MusicDoge", path: "Source"),
    ]
)