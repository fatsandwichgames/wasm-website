// swift-tools-version:5.3
import PackageDescription

let package = Package(
    name: "Games",
    platforms: [.macOS(.v11)],
    products: [
        .executable(name: "Games", targets: ["Games"])
    ],
    dependencies: [
        .package(name: "Tokamak", url: "https://github.com/TokamakUI/Tokamak", from: "0.6.1")
    ],
    targets: [
        .target(
            name: "Games",
            dependencies: [
                .product(name: "TokamakShim", package: "Tokamak")
            ]
            //,resources: [.copy("logo-header.png")]
            ),
        .testTarget(
            name: "GamesTests",
            dependencies: ["Games"]),
    ]
)
