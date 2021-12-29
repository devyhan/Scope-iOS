//
//  AppView.swift
//  Application_iOS
//
//  Created by 조요한 on 2021/11/10.
//

import SwiftUI
import ComposableArchitecture
import UserInterface

struct AppView: View {
  let store: Store<AppState, AppAction>
  
  init(store: Store<AppState, AppAction>) {
    self.store = store
  }
  
  var body: some View {
    WithViewStore(store) { viewStore in
      NavigationView {
        ZStack {
          HomeView(
            store: store.scope(
              state: \.home,
              action: AppAction.home
            )
          )
        }
        .disabledNavigationBarStyle()
        .ignoresSafeArea()
      }
      .onAppear {
        viewStore.send(.onAppear)
      }
    }
  }
}

#if DEBUG
  // MARK: - SwiftUI previews
  struct Chatroom_Previews: PreviewProvider {
    static var previews: some View {
      AppView(
        store: .init(
          initialState: AppState(),
          reducer: AppView.appReducer,
          environment: .live
        )
      )
    }
  }
#endif
