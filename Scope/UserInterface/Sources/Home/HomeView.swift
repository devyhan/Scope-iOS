//
//  HomeView.swift
//  UserInterface
//
//  Created by 조요한 on 2021/12/28.
//  Copyright © 2021 com.devyhan93.scope. All rights reserved.
//

import ComposableArchitecture
import SwiftUI

public struct HomeView: View {
  let store: Store<HomeState, HomeAction>
  
  public init(store: Store<HomeState, HomeAction>) {
    self.store = store
  }
  
  public var body: some View {
    WithViewStore(store) { viewStore in
      ZStack {
        MapView(
          pointsOfInterest: viewStore.pointsOfInterest,
          region: viewStore.binding(get: { $0.region }, send: HomeAction.updateRegion)
        )
      }
    }
  }
}

public struct HomeState: Equatable {
  public var pointsOfInterest: [PointOfInterest] = []
  public var region: CoordinateRegion?
  public init() {}
}

public enum HomeAction {
  case updateRegion(CoordinateRegion?)
}
