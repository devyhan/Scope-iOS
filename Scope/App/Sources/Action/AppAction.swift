//
//  AppAction.swift
//  Application_iOS
//
//  Created by ์กฐ์ํ on 2021/12/05.
//

import ComposableArchitecture
import UserInterface

enum AppAction {
  case onAppear
  case home(HomeAction)
  case appVersionResponse(Result<String, Never>)
}
