// swift-tools-version:6.0
import PackageDescription

let package = Package(
    name: "GFMarkdown",
    platforms: [.macOS(.v13)],
    products: [
        .library(
            name: "GFMarkdown",
            targets: ["GFMarkdown"]),
    ],
    dependencies: [
        .package(url: "https://github.com/apple/swift-cmark.git", from: "0.5.0"),
    ],
    targets: [
        .target(
            name: "CMarkGFMPlus",
            dependencies: [
                .product(name: "cmark-gfm", package: "swift-cmark"),
                .product(name: "cmark-gfm-extensions", package: "swift-cmark"),
            ]
        ),
        .target(
            name: "GFMarkdown",
            dependencies: [
                "CMarkGFMPlus"
            ]),
        .testTarget(
            name: "GFMarkdownTests",
            dependencies: ["GFMarkdown"]),
    ]
)
