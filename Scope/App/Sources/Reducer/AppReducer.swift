//
//  AppReducer.swift
//  Application_iOS
//
//  Created by 조요한 on 2021/12/01.
//

import ComposableArchitecture
import FirebaseCrashlytics
import Vendor

extension AppView {
  public static let appReducer = Reducer.combine(
    scopeChangeReducer,
    Reducer<AppState, AppAction, AppEnvironment>() { state, action, environment in
      switch action {
      case .onAppear:
        environment.firebase
          .registerFacade
          .register(bundle: Bundle.module, scheme: "Dev")
        return .none
      case .incrementButtonTapped:
        state.count += 1
        return .none
        //      case .binding:
        //        return .none
        
        //      case .searchQueryChanged:
        //        return environment.weatherClient
        //          .getWeather
        //          .execute(id: "44418")
        //          .receive(on: environment.mainQueue)
        //          .catchToEffect()
        //          .map { AppAction.locationWeatherResponse($0) }
        
        //      case .locationWeatherResponse(.success(let location)):
        //        print("location: \(location)")
        //        return .none
        //
        //      case .locationWeatherResponse(.failure(let error)):
        //        print("error: \(error)")
        //        return .none
        
      default:
        return .none
      }
    }
  )
}

extension AppView {
  public static let scopeChangeReducer = Reducer<AppState, AppAction, AppEnvironment>() {
    state, action, environment in
    switch action {
    case .binding(\.$searchQuery) where state.searchQuery.lowercased() == "weatherclient":
      state.scope = .weatherClient(WeatherClientState())
      return .none
    case .binding(\.$searchQuery) where state.searchQuery.lowercased() == "home":
      return .none
      
    default:
      return .none
    }
  }.binding()
}
