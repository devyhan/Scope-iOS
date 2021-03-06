import ProjectDescription

extension Project {
    public static func frameworkTargets(
        name: String,
        frameworkDependencies: [TargetDependency],
        testDependencies: [TargetDependency],
        isFramework: Bool? = nil
    ) -> [Target] {
        let sources = Target(
            name: name,
            platform: .iOS,
            product: isFramework ?? true ? .staticFramework : .staticLibrary,
            bundleId: "com.scope.\(name)",
            infoPlist: .extendingDefault(with: infoPlist),
            sources: ["Sources/**"],
            resources: [],
            dependencies: [] + frameworkDependencies
        )
        
        let tests = Target(
            name: "\(name)Tests",
            platform: .iOS,
            product: .unitTests,
            bundleId: "com.scope.\(name)Tests",
            infoPlist: .default,
            sources: ["Tests/**"],
            resources: [],
            dependencies: [.target(name: name)] + testDependencies
        )
        
        return [sources, tests]
    }
}
