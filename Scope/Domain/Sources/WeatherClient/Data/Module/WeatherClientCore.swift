//
//  WeatherClientCore.swift
//  CommonData_iOS
//
//  Created by ์กฐ์ํ on 2021/12/01.
//

public final class WeatherClientCore: Core {
  public var getWeather: GetWeather
  public var getLocation: GetLocation
  
  public init() {
    self.getWeather = GetWeatherImpl()
    self.getLocation = GetLoactionImpl()
  }
}
