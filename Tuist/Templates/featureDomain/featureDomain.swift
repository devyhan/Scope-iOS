import ProjectDescription

let featureDomainNameAttribute: Template.Attribute = .required("name")

let featureDomainTestContents = """
import Foundation
import XCTest
import ComposableArchitecture
import ComposableTuistArchitectureSupport
@testable import \(featureDomainNameAttribute)

final class \(featureDomainNameAttribute)Tests: XCTestCase {
    func testExample() {
        // Add your test here
    }
}
"""

let domainTemplate = Template(
  description: "Feature template",
  attributes: [
    featureDomainNameAttribute,
    .optional("platform", default: "iOS")
  ],
  items: [
    .file(path: "Scope/\(featureDomainNameAttribute)/Sources/\(featureDomainNameAttribute).swift", templatePath: "view.stencil"),
    .file(path: "Scope/\(featureDomainNameAttribute)/Sources/\(featureDomainNameAttribute)Store.swift", templatePath: "store.stencil"),
    .string(path: "Scope/\(featureDomainNameAttribute)/Tests/\(featureDomainNameAttribute)Tests.swift", contents: featureDomainTestContents),
    .file(path: "Scope/\(featureDomainNameAttribute)/Project.swift", templatePath: "project.stencil")
  ]
)
