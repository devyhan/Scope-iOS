import ProjectDescription
import ProjectDescriptionHelpers

let project = Project(
    name: "Domain",
    organizationName: "com.devyhan93.scope",
    options: [.textSettings(indentWidth: 2, tabWidth: 2)],
    targets: Project.staticFrameworkTargets(
        name: "Domain",
        frameworkDependencies: [
            .external(name: "ComposableArchitecture"),
        ],
        testDependencies: []
    ),
    schemes: [],
    additionalFiles: []
)
