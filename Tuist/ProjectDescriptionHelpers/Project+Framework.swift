import ProjectDescription

extension Project {
    public static func staticFrameworkTargets(
        name: String,
        frameworkDependencies: [TargetDependency],
        testDependencies: [TargetDependency]
    ) -> [Target] {
        let sources = Target(
            name: name,
            platform: .iOS,
            product: .staticFramework,
            bundleId: "com.devyhan93.\(name)",
            infoPlist: .extendingDefault(with: infoPlist),
            sources: ["Sources/**"],
            resources: [],
            dependencies: [
                .external(name: "ComposableArchitecture"),
            ] + frameworkDependencies
        )
        
        let tests = Target(
            name: "\(name)Tests",
            platform: .iOS,
            product: .unitTests,
            bundleId: "com.devyhan93.\(name)Tests",
            infoPlist: .default,
            sources: ["Tests/**"],
            resources: [],
            dependencies: [.target(name: name)] + testDependencies
        )
        
        return [sources, tests]
    }
}


