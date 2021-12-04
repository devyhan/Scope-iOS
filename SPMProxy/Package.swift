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
    .package(url: "https://github.com/pointfreeco/swift-composable-architecture", from: "0.27.1"),
    .package(url: "https://github.com/siteline/SwiftUI-Introspect.git", from: "0.1.3"),
    .package(url: "https://github.com/Alamofire/Alamofire.git", from: "5.4.4")
  ],
  targets: [
    .target(
      name: "SPMProxy",
      dependencies: [
        .product(
          name: "ComposableArchitecture",
          package: "swift-composable-architecture"
        ),
        .product(
          name: "Introspect",
          package: "SwiftUI-Introspect"
        ),
        .product(
          name: "Alamofire",
          package: "Alamofire"
        )
      ]
    )
  ]
)
