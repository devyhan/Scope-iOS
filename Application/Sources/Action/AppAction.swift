//
//  AppAction.swift
//  Application_iOS
//
//  Created by 조요한 on 2021/12/05.
//

import ComposableArchitecture
import WeatherClient

enum AppAction: BindableAction {
  case binding(BindingAction<AppState>)
  case home(HomeAction)
  case weatherClient(WeatherClientAction)
}

enum HomeAction {}
enum WeatherClientAction {}
