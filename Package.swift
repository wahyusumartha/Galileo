// swift-tools-version:5.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Galileo",
    products: [
        .library(
            name: "Galileo",
            targets: ["Galileo"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
		.package(url: "https://github.com/swift-server/async-http-client.git", from: "1.0.0")
	],
    targets: [
        .target(
            name: "Galileo",
            dependencies: ["AsyncHTTPClient"]),
        .testTarget(
            name: "GalileoTests",
            dependencies: ["Galileo"]),
    ]
)
