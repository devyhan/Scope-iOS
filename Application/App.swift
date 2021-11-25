import SwiftUI
import ComposableArchitecture

@main
struct Scope: App {
  var body: some Scene {
    WindowGroup {
      AppView(
        store: Store(
          initialState: SearchState(),
          reducer: searchReducer,
          environment: SearchEnvironment(
            weatherClient: WeatherClient.live,
            mainQueue: .main
          )
        )
      )
      .inject()
    }
  }
}
