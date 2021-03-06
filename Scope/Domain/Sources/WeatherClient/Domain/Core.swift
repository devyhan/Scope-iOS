//
//  Core.swift
//  WeatherClient_iOS
//
//  Created by ์กฐ์ํ on 2021/12/03.
//

import Foundation

public protocol Core {
  var getWeather: GetWeather { get }
  var getLocation: GetLocation { get }
}
