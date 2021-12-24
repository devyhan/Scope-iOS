//
//  FirebaseTest.swift
//  VenderTests
//
//  Created by 조요한 on 2021/12/22.
//  Copyright © 2021 com.devyhan93.scope. All rights reserved.
//

import Combine
import XCTest
@testable import Vender

import FirebaseCore
import FirebaseRemoteConfig

class FirebaseTest: XCTestCase {
  private let firebase = FirebaseCore()
  private var cancellables = Set<AnyCancellable>()
  
  func test_remote_config() {
    firebase.firebaseRegisterFacade
      .execute(bundle: Bundle.main, scheme: "")
    
    firebase.firebaseRemoteConfigFacade
      .getRequiredVersion
      .sink(
        receiveCompletion: { print("✅", $0) },
        receiveValue: {
          XCTAssertEqual("", $0 ?? "")
        }
      )
      .store(in: &cancellables)
  }
}
