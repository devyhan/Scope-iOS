//
//  AppAction.swift
//  Application_iOS
//
//  Created by 조요한 on 2021/12/05.
//

import ComposableArchitecture

enum AppAction: BindableAction {
  case onAppear
  case binding(BindingAction<AppState>)
  case home(HomeAction)
  case weatherClient(WeatherClientAction)
  
  case incrementButtonTapped
}

enum HomeAction {}
enum WeatherClientAction {}
