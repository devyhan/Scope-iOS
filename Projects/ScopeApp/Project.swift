import ProjectDescription
import ProjectDescriptionHelpers

let project = Project(
    name: "ScopeApp",
    organizationName: "com.devyhan93.scope",
    settings: .settings(base: SettingsDictionary().otherLinkerFlags("-ObjC")),
    targets: Project.appTargets(
        name: "ScopeApp",
        appDependencies: [
            .project(target: "ScopeCore", path: "../ScopeCore"),
            .project(target: "ScopeUI", path: "../ScopeUI"),
            .project(target: "Vender", path: "../Vender"),
            .external(name: "ComposableArchitecture"),
        ],
        testDependencies: []
    ),
    schemes: [],
    additionalFiles: []
)

//let hasDynamicFramework = targets.contains(.dynamicFramework)
//let settings: SettingsDictionary = hasDynamicFramework
//? ["OTHER_LDFLAGS" : "$(inherited) -all_load"]
//: ["OTHER_LDFLAGS" : "$(inherited)"]

//let baseSettings: SettingsDictionary = [
//    "OTHER_LDFLAGS": "$(inherited) -lStaticLib"
//]


//let baseSettings = SettingsDictionary()
//    .otherSwiftFlags("-ObjC")

public extension SettingsDictionary {
  func otherLinkerFlags(_ value: String) -> SettingsDictionary {
      merging(["OTHER_LDFLAGS": SettingValue(stringLiteral: value)])
  }
}
