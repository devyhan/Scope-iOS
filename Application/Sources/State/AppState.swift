//
//  AppState.swift
//  Application_iOS
//
//  Created by 조요한 on 2021/12/05.
//

import ComposableArchitecture

struct AppState: Equatable {
  @BindableState var searchQuery: String = "Scope"
  @BindableState var isSearchBarHidden: Bool = false
  var scope: Scope = .home(HomeState())
  
  enum Scope: CaseIterable, Equatable {
    case home(HomeState?)
    case weatherClient(WeatherClientState?)
    
    static var allCases: [AppState.Scope] = [
      .home(nil),
      .weatherClient(nil)
    ]
  }
}

struct HomeState: Equatable {
  var allCase: [String] = AppState.Scope.allCases.map {
    String(describing: $0.self).replacingOccurrences(of: "(nil)", with: "")
  }
}

struct WeatherClientState: Equatable {}
