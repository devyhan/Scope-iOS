import SwiftUI
import ComposableArchitecture
import WeatherClientData

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
      .inject()
    }
  }
}

extension AppEnvironment {
  static let live: AppEnvironment = { 
    let weatherClient = WeatherClientCore()
    
    return .init(
      mainQueue: .main,
      weatherCLient: weatherClient
    )
  }()
}
