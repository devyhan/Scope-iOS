// swift-tools-version:5.3
import PackageDescription

let package = Package(
  name: "SPMProxy",
  platforms: [
    .iOS(.v14),
  ],
  products: [
    .library(
      name: "SPMProxy",
      type: .dynamic,
      targets: ["SPMProxy"]
    ),
  ],
  dependencies: [
    .package(url: "https://github.com/pointfreeco/swift-composable-architecture", from: "0.27.1")
  ],
  targets: [
    .target(
      name: "SPMProxy",
      dependencies: [
        .product(
          name: "ComposableArchitecture",
          package: "swift-composable-architecture"
        )
      ]
    )
  ]
)
