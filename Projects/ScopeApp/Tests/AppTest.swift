//
//  AppTest.swift
//  ScopeAppTests
//
//  Created by 조요한 on 2021/12/13.
//  Copyright © 2021 com.devyhan93.scope. All rights reserved.
//

import XCTest
import ComposableArchitecture

@testable import ScopeApp

class AppTest: XCTestCase {
    let scheduler = DispatchQueue.test
    let store = TestStore(
      initialState: AppState(),
      reducer: AppView.appReducer,
      environment: .live
    )
    
    func test_increment_button_tapped() {
        store.send(.incrementButtonTapped) {
            $0.count = 1
        }
    }
}
