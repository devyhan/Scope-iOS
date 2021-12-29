//
//  AppState.swift
//  Application_iOS
//
//  Created by 조요한 on 2021/12/05.
//

import ComposableArchitecture
import UserInterface

struct AppState: Equatable {
  var home: HomeState = .init()
}
