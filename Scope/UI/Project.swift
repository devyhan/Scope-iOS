import ProjectDescription
import ProjectDescriptionHelpers

let project = Project(
    name: "UI",
    organizationName: "com.devyhan93.scope",
    options: [.textSettings(indentWidth: 2, tabWidth: 2)],
    targets: Project.staticFrameworkTargets(
        name: "UI",
        frameworkDependencies: [
            .external(name: "ComposableArchitecture"),
        ],
        testDependencies: []
    ),
    schemes: [],
    additionalFiles: []
)
