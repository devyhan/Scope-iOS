import ProjectDescription
import ProjectDescriptionHelpers

let project = Project(
    name: "UI",
    organizationName: "com.devyhan93.scope",
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
