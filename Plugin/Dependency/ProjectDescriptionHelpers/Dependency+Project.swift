//
//  Dependency+Project.swift
//  Dependency
//
//  Created by 조요한 on 2021/12/24.
//

import ProjectDescription

extension Target {
    public struct Project {
        public struct Common {}
        public struct Domain {}
        public struct ThirdPartyLibrary {}
        public struct UserInterface {}
        public struct Vendor {}
    }
}

public extension Target.Project.Common {
    static let common = project(name: "Common", path: "../Common")
}

public extension Target.Project.Domain {
    static let domain = project(name: "Domain", path: "../Domain")
}

public extension Target.Project.ThirdPartyLibrary {
    static let thirdPartyLibrary = project(name: "ThirdPartyLibrary", path: "../ThirdPartyLibrary")
}

public extension Target.Project.UserInterface {
    static let userInterface = project(name: "UserInterface", path: "../UserInterface")
}

public extension Target.Project.Vendor {
    static let vendor = project(name: "Vendor", path: "../Vendor")
}

private func project(name: String, path: String) -> Target {
    .project(target: "\(name)", path: "\(path)")
}
