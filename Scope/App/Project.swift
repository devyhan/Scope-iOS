import ProjectDescription
import ProjectDescriptionHelpers

let project = Project(
    name: "App",
    organizationName: "com.devyhan93.scope",
    options: [.textSettings(indentWidth: 2, tabWidth: 2)],
    settings: .settings(base: SettingsDictionary().otherLinkerFlags("-ObjC")),
    targets: Project.appTargets(
        name: "App",
        appDependencies: [
            .project(target: "Core", path: "../Core"),
            .project(target: "UI", path: "../UI"),
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
