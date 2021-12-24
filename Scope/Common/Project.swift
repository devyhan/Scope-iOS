import Dependency
import ProjectDescription
import ProjectDescriptionHelpers

let project = Project(
    name: "Common",
    organizationName: "com.devyhan93.scope",
    options: [.textSettings(indentWidth: 2, tabWidth: 2)],
    targets: Project.frameworkTargets(
        name: "Common",
        frameworkDependencies: [],
        testDependencies: []
    ),
    schemes: [],
    additionalFiles: []
)
