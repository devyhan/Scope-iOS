//
//  AppState.swift
//  Application_iOS
//
//  Created by ์กฐ์ํ on 2021/12/05.
//

import ComposableArchitecture
import UserInterface

struct AppState: Equatable {
  var home: HomeState = .init()
}
