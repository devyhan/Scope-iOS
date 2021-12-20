import ProjectDescription
import ProjectDescriptionHelpers

let project = Project(
    name: "App",
    organizationName: "com.devyhan93.scope",
    options: [.textSettings(indentWidth: 2, tabWidth: 2)],
    settings: .settings(base: SettingsDictionary().otherLinkerFlags("-ObjC").debugInformationFormat(.dwarfWithDsymFile)),
    targets: Project.appTargets(
        name: "App",
        appDependencies: [
            .project(target: "Domain", path: "../Domain"),
            .project(target: "UI", path: "../UI"),
            .project(target: "Vender", path: "../Vender"),
            .external(name: "ComposableArchitecture"),
        ],
        testDependencies: []
    ),
    schemes: [],
    additionalFiles: []
)

//DWARF as the debug information format. [dwarf] * *DWARF with dSYM File
//dwarf dwarf-with-dsym


public extension SettingsDictionary {
    enum DebugInformation: String {
        case dwarf = "dwarf"
        case dwarfWithDsymFile = "dwarf-with-dsym"
    }
    
    func otherLinkerFlags(_ value: String) -> SettingsDictionary {
        merging(["OTHER_LDFLAGS": SettingValue(stringLiteral: value)])
    }
    
    func debugInformationFormat(_ value: DebugInformation) -> SettingsDictionary {
        merging(["DEBUG_INFORMATION_FORMAT": SettingValue(stringLiteral: value.rawValue)])
    }
}


