import ProjectDescription

let featureUINameAttribute: Template.Attribute = .required("name")

let featureUITestContents = """
import Foundation
import XCTest
import ComposableArchitecture
import ComposableTuistArchitectureSupport
@testable import \(featureUINameAttribute)

final class \(featureUINameAttribute)Tests: XCTestCase {
    func testExample() {
        // Add your test here
    }
}
"""

let userInterfaceTemplate = Template(
  description: "Feature template",
  attributes: [
    featureUINameAttribute,
    .optional("platform", default: "iOS")
  ],
  items: [
    .file(path: "Scope/\(featureUINameAttribute)/Sources/\(featureUINameAttribute)Action.swift", templatePath: "featureAction.stencil"),
    .file(path: "Scope/\(featureUINameAttribute)/Sources/\(featureUINameAttribute)Environment.swift", templatePath: "featureEnvironment.stencil"),
    .file(path: "Scope/\(featureUINameAttribute)/Sources/\(featureUINameAttribute)Reducer.swift", templatePath: "featureReducer.stencil"),
    .file(path: "Scope/\(featureUINameAttribute)/Sources/\(featureUINameAttribute)State.swift", templatePath: "featureState.stencil"),
  ]
)
