import Dependency
import ProjectDescription
import ProjectDescriptionHelpers

let project = Project(
    name: "ThirdPartyLibrary",
    organizationName: "com.devyhan93.scope",
    options: [.textSettings(indentWidth: 2, tabWidth: 2)],
    packages: [
        .composableArchitecture,
        .composableCoreLocation
    ],
    targets: Project.dynamicFrameworkTargets(
        name: "ThirdPartyLibrary",
        frameworkDependencies: [
            .SPM.composableArchitecture,
            .SPM.composableCoreLocation
        ],
        testDependencies: []
    )
)
