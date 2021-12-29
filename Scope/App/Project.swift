import Dependency
import ProjectDescription
import ProjectDescriptionHelpers

let project = Project(
    name: "App",
    organizationName: "com.devyhan93.scope",
    options: [.textSettings(indentWidth: 2, tabWidth: 2)],
//    packages: [ .composableArchitecture ],
    settings: .settings(base: SettingsDictionary().otherLinkerFlags("-ObjC").debugInformationFormat(.dwarfWithDsymFile)),
    targets: Project.appTargets(
        name: "App",
        appDependencies: [
            .Project.Common.common,
            .Project.Domain.domain,
            .Project.UserInterface.userInterface,
            .Project.Vendor.vendor,
            .Project.ThirdPartyLibrary.thirdPartyLibrary
        ],
        testDependencies: []
    ),
    schemes: [],
    additionalFiles: []
)


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


