// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "MeCabIPAdic",
    products: [
        .library(
            name: "MeCabIPAdic",
            targets: ["MeCabIPAdic"]),
    ],
    dependencies: [
        .package(
            url: "https://github.com/trickart/MeCab.git",
            .upToNextMinor(from: "0.0.2")
        )
    ],
    targets: [
        .target(
            name: "MeCabIPAdic",
            dependencies: ["MeCab"],
            resources: [
                .copy("Resources/char.bin"),
                .copy("Resources/dicrc"),
                .copy("Resources/left-id.def"),
                .copy("Resources/matrix.bin"),
                .copy("Resources/pos-id.def"),
                .copy("Resources/rewrite.def"),
                .copy("Resources/right-id.def"),
                .copy("Resources/sys.dic"),
                .copy("Resources/unk.dic")
            ]
        ),
        .testTarget(
            name: "MeCabIPAdicTests",
            dependencies: ["MeCab", "MeCabIPAdic"]),
    ]
)
