import Dependency
import ProjectDescription
import ProjectDescriptionHelpers

let project = Project(
    name: "Vendor",
    organizationName: "com.devyhan93.scope",
    options: [.textSettings(indentWidth: 2, tabWidth: 2)],
    targets: Project.staticFrameworkTargets(
        name: "Vendor",
        frameworkDependencies: TargetDependency.Framework.Vendor.firebases,
        testDependencies: []
    ),
    schemes: [],
    additionalFiles: []
)
