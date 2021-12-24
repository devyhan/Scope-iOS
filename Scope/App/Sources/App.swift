import ComposableArchitecture
import Domain
import SwiftUI
import Vendor

@main
struct Scope: App {
  var body: some Scene {
    WindowGroup {
      AppView(
        store: Store(
          initialState: AppState(),
          reducer: AppView.appReducer,
          environment: .live
        )
      )
    }
  }
}

extension AppEnvironment {
  static let live: AppEnvironment = {
    let weatherClient = WeatherClientCore()
    let firebase = FirebaseCore()
    
    return .init(
      mainQueue: .main,
      weatherCLient: weatherClient,
      firebase: firebase
    )
  }()
}

public extension Optional {
  var isNil: Bool {
    guard case Optional.none = self else {
      return false
    }
    return true
  }
}
