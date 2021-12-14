import ProjectDescription
import ProjectDescriptionHelpers

let project = Project(
    name: "ScopeCore",
    organizationName: "com.devyhan93.scope",
    targets: Project.staticFrameworkTargets(
        name: "ScopeCore",
        frameworkDependencies: [],
        testDependencies: []
    ),
    schemes: [],
    additionalFiles: []
)
