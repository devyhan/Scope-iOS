//
//  Dependency+Project.swift
//  Dependency
//
//  Created by 조요한 on 2021/12/24.
//

import ProjectDescription

extension TargetDependency {
    public struct Project {
        public struct Common {}
        public struct Domain {}
        public struct UserInterface {}
        public struct Vendor {}
    }
}

public extension TargetDependency.Project.Common {
    static let common = project(name: "Common", path: "../Common")
}

public extension TargetDependency.Project.Domain {
    static let domain = project(name: "Domain", path: "../Domain")
}

public extension TargetDependency.Project.UserInterface {
    static let userInterface = project(name: "UserInterface", path: "../UserInterface")
}

public extension TargetDependency.Project.Vendor {
    static let vendor = project(name: "Vendor", path: "../Vendor")
}

private func project(name: String, path: String) -> TargetDependency {
    .project(target: "\(name)", path: "\(path)")
}

