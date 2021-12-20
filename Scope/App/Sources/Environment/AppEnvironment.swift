//
//  AppEnvironment.swift
//  Application_iOS
//
//  Created by 조요한 on 2021/12/01.
//

import ComposableArchitecture
import Domain
import Vender

public class AppEnvironment {
  let mainQueue: AnySchedulerOf<DispatchQueue>
  let weatherClient: Domain.Core
  let firebase: Vender.Core
  
  public init(
    mainQueue: AnySchedulerOf<DispatchQueue>,
    weatherCLient: Domain.Core,
    firebase: Vender.Core
  ) {
    self.mainQueue = mainQueue
    self.weatherClient = weatherCLient
    self.firebase = firebase
  }
}
