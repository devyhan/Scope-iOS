//
//  Dependency+Framework.swift
//  Dependency
//
//  Created by 조요한 on 2021/12/24.
//

import ProjectDescription

extension Target {
    public struct Framework {
        public struct Vendor {}
    }
}

public extension Target.Framework.Vendor {
    private static func firebase(name: String) -> Target {
        .xcframework(path: .relativeToRoot("Libraries/Vendor/Firebase/\(name).xcframework"))
    }

    static let firebases: [Target] = [
        firebase(name: "FirebaseAnalytics"),
        firebase(name: "FirebaseABTesting"),
        firebase(name: "FirebaseCore"),
        firebase(name: "FirebaseCoreDiagnostics"),
        firebase(name: "FirebaseCrashlytics"),
        firebase(name: "FirebaseInstallations"),
        firebase(name: "FirebaseRemoteConfig"),
        firebase(name: "GoogleAppMeasurement"),
        firebase(name: "GoogleAppMeasurementIdentitySupport"),
        firebase(name: "GoogleDataTransport"),
        firebase(name: "GoogleUtilities"),
        firebase(name: "nanopb"),
        firebase(name: "PromisesObjC")
    ]
}
        
