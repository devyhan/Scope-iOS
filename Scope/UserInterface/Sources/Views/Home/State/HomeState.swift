//
//  HomeState.swift
//  UserInterface
//
//  Created by 조요한 on 2021/12/29.
//  Copyright © 2021 com.devyhan93.scope. All rights reserved.
//

public struct HomeState: Equatable {
  public var pointsOfInterest: [PointOfInterest] = []
  public var region: CoordinateRegion?
  public init() {}
}
