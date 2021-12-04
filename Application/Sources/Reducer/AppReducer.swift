//
//  AppReducer.swift
//  Application_iOS
//
//  Created by 조요한 on 2021/12/01.
//

import ComposableArchitecture
import WeatherClient
import WeatherClientData

enum AppAction {
  case searchQueryChanged(String)
  case locationWeatherResponse(Result<LocationWeather, Error>)
}

struct AppState: Equatable {
  var scopes: [String] = Scopes.allCases.map { $0.rawValue }
}

extension AppView {
  public static let appReducer = Reducer.combine(
    Reducer<AppState, AppAction, AppEnvironment>() { state, action, environment in
      switch action {
      case .searchQueryChanged:
        return environment.weatherClient
          .getWeather
          .execute(id: "44418")
          .receive(on: environment.mainQueue)
          .catchToEffect()
          .map { AppAction.locationWeatherResponse($0) }
        
      case .locationWeatherResponse(.success(let location)):
        print("location: \(location)")
        return .none
        
      case .locationWeatherResponse(.failure(let error)):
        print("error: \(error)")
        return .none
        
      default:
        return .none
      }
    }
  )
}
