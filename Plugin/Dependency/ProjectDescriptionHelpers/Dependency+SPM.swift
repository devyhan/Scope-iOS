//
//  Dependency+SPM.swift
//  Dependency
//
//  Created by 조요한 on 2021/12/24.
//

import ProjectDescription

extension TargetDependency {
    public struct SPM {}
}

public extension TargetDependency.SPM {
    static let composableArchitecture = TargetDependency.package(product: "ComposableArchitecture")
    static let composableCoreLocation = TargetDependency.package(product: "ComposableCoreLocation")
}

public extension Package {
    static let composableArchitecture = Package.package(url: "https://github.com/pointfreeco/swift-composable-architecture.git", .upToNextMajor(from: "0.29.0"))
    static let composableCoreLocation = Package.package(url: "https://github.com/pointfreeco/composable-core-location.git", .upToNextMajor(from: "0.1.0"))
}
