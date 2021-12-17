import Combine
import ProjectDescription

let infoPlist: [String: InfoPlist.Value] = [
    "UILaunchScreen": [:]
]

//let targetScripts = [
//    TargetScript.pre(
//        path: "../../bin/crashlytics/script.sh",
//        arguments: [],
//        name: "Crashlytics"
//    )
//]

extension Project {
    public static func appTargets(
        name: String,
        appDependencies: [TargetDependency],
        testDependencies: [TargetDependency]
    ) -> [Target] {
        let sources = Target(
            name: name,
            platform: .iOS,
            product: .app,
            bundleId: "com.devyhan93.\(name)",
            infoPlist: .extendingDefault(with: infoPlist),
            sources: ["Sources/**"],
            resources: ["Resources/**"],
//            scripts: targetScripts,
            dependencies: appDependencies

        )
        
        let testTarget = Target(
            name: "\(name)Tests",
            platform: .iOS,
            product: .unitTests,
            bundleId: "com.devyhan93.\(name)Tests",
            infoPlist: .default,
            sources: ["Tests/**"],
            dependencies: [.target(name: "\(name)")] + testDependencies
        )
        
        return [sources, testTarget]
    }
}

public extension TargetDependency {
    private static func firebase(name: String) -> TargetDependency { .xcframework(path: .relativeToRoot("Libraries/Vendor/Firebase/\(name).xcframework")) }
    
    static let firebase: [TargetDependency] = [
        firebase(name: "FirebaseAnalytics"),
        firebase(name: "FirebaseCore"),
        firebase(name: "FirebaseCoreDiagnostics"),
        firebase(name: "FirebaseCrashlytics"),
        firebase(name: "FirebaseInstallations"),
        firebase(name: "GoogleAppMeasurement"),
        firebase(name: "GoogleDataTransport"),
        firebase(name: "GoogleUtilities"),
        firebase(name: "nanopb"),
        firebase(name: "PromisesObjC"),
    ]
}
