// swift-tools-version: 6.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "tgh_xc_buildsettings",
    platforms: [.macOS(.v15)],
    targets: [
        .executableTarget(
            name: "tgh_xc_buildsettings"
        ),
    ]
)
