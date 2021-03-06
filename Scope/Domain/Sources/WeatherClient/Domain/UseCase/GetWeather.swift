//
//  GetWeather.swift
//  CommonData_iOS
//
//  Created by ์กฐ์ํ on 2021/12/01.
//

import Combine

public protocol GetWeather {
  func execute(id: String) -> AnyPublisher<LocationWeather, Error>
}
