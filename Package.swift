// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "AIService",
    platforms: [
        .iOS(.v15)
    ],
    products: [
        .library(
            name: "AIService",
            targets: ["AIService"]
        )
    ],
    targets: [
        .binaryTarget(
            name: "AIService",
            url: "https://github.com/AperoVN/AIService-Distribution/releases/download/1.0.0-alpha01/AIService.xcframework.zip",
            checksum: "009d1491d32cf6341e21b664607faf71798f1331dd1d391e746158dd11c64072"
        )
    ]
)
