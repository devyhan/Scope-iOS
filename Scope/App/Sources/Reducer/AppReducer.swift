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
    Reducer<AppState, AppAction, AppEnvironment>() { state, action, environment in
      switch action {
      case .onAppear:
        return environment.firebase
          .remoteConfigFacade
          .execute(key: "required_version", scheme: "debug")
          .receive(on: environment.mainQueue)
          .catchToEffect(AppAction.appVersionResponse)
        
      case let .appVersionResponse(.success(version)):
        print("✅ Version :", version)
        return .none
      default:
        return .none
      }
    }
  )
}
