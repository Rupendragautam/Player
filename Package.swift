// swift-tools-version:5.9
import PackageDescription

let package = Package(
    name: "Player",
    platforms: [
        .iOS(.v12),
        .tvOS(.v12)
    ],
    products: [
        .library(
            name: "Player",
            targets: ["Player"]
        )
    ],
    targets: [
        .target(
            name: "Player",
            path: "Sources"
        )
    ],
    swiftLanguageVersions: [.v5]
)
