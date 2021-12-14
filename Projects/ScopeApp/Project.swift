import ProjectDescription
import ProjectDescriptionHelpers

let project = Project(
    name: "ScopeApp",
    organizationName: "com.devyhan93.scope",
    targets: Project.appTargets(
        name: "ScopeApp",
        appDependencies: [
            .project(target: "ScopeCore", path: "../ScopeCore"),
            .project(target: "ScopeUI", path: "../ScopeUI")
        ],
        testDependencies: []
    ),
    schemes: [],
    additionalFiles: []
)


