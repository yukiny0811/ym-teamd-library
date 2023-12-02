// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "TeamDLibrary",
    platforms: [
        .iOS(.v17)
    ],
    products: [
        .library(
            name: "TeamDLibrary",
            targets: ["TeamDLibrary"]
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/yukiny0811/easy-utilities", from: "1.0.7"),
        .package(url: "https://github.com/MessageKit/MessageKit", from: "4.2.0"),
    ],
    targets: [
        .target(
            name: "TeamDLibrary",
            dependencies: [
                .product(name: "EasyUtilities", package: "easy-utilities"),
                "MessageKit",
            ]
        ),
    ]
)
