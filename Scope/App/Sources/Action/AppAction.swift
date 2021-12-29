//
//  AppAction.swift
//  Application_iOS
//
//  Created by 조요한 on 2021/12/05.
//

import ComposableArchitecture
import UserInterface

enum AppAction {
  case onAppear
  case home(HomeAction)
  case appVersionResponse(Result<String, Never>)
}
