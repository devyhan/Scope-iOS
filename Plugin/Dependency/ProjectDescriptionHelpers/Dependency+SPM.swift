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
}

public extension Package {
    static let composableArchitecture = Package.package(url: "https://github.com/pointfreeco/swift-composable-architecture.git", .upToNextMajor(from: "0.29.0"))
}
