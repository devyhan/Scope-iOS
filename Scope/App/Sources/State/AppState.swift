//
//  AppState.swift
//  Application_iOS
//
//  Created by 조요한 on 2021/12/05.
//

import ComposableArchitecture

public struct AppState: Equatable {
  @BindableState public var searchQuery: String = "Scope"
  @BindableState var isSearchBarHidden: Bool = false
  
  var seqrchQueryString: String = "Scope"
  var scope: Scope = .home(HomeState())
  var count: Int = .zero
  var someValue: String?
  
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
