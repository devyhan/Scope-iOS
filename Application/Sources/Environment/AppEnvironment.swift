//
//  AppEnvironment.swift
//  Application_iOS
//
//  Created by 조요한 on 2021/12/01.
//

import ComposableArchitecture

import WeatherClient

public class AppEnvironment {
  let mainQueue: AnySchedulerOf<DispatchQueue>
  let weatherClient: WeatherClient.Core
  
  public init(
    mainQueue: AnySchedulerOf<DispatchQueue>,
    weatherCLient: WeatherClient.Core
  ) {
    self.mainQueue = mainQueue
    self.weatherClient = weatherCLient
  }
}
