import ProjectDescription
import ProjectDescriptionHelpers

let project = Project(
    name: "Vender",
    organizationName: "com.devyhan93.scope",
    targets: Project.staticFrameworkTargets(
        name: "Vender",
        frameworkDependencies: TargetDependency.firebase,
        testDependencies: []
    ),
    schemes: [],
    additionalFiles: []
)
