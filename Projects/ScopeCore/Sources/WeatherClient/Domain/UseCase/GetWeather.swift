//
//  GetWeather.swift
//  CommonData_iOS
//
//  Created by 조요한 on 2021/12/01.
//

import Combine

public protocol GetWeather {
  func execute(id: String) -> AnyPublisher<LocationWeather, Error>
}
