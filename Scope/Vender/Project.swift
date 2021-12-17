import ProjectDescription
import ProjectDescriptionHelpers

let project = Project(
    name: "Vender",
    organizationName: "com.devyhan93.scope",
    options: [.textSettings(indentWidth: 2, tabWidth: 2)],
    targets: Project.staticFrameworkTargets(
        name: "Vender",
        frameworkDependencies: TargetDependency.firebase,
        testDependencies: []
    ),
    schemes: [],
    additionalFiles: []
)
