//
//  Core.swift
//  WeatherClient_iOS
//
//  Created by 조요한 on 2021/12/03.
//

import Foundation

public protocol Core {
  var getWeather: GetWeather { get }
  var getLocation: GetLocation { get }
}
