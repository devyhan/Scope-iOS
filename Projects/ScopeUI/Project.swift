import ProjectDescription
import ProjectDescriptionHelpers

let project = Project(
    name: "ScopeUI",
    organizationName: "com.devyhan93.scope",
    targets: Project.staticFrameworkTargets(
        name: "ScopeUI",
        frameworkDependencies: [],
        testDependencies: []
    ),
    schemes: [],
    additionalFiles: []
)
