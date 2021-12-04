//
//  LocationWeather.swift
//  CommonData_iOS
//
//  Created by 조요한 on 2021/12/03.
//

import Foundation

public struct LocationWeather: Equatable {
  public let id: String
  public let consolidateWeather: Array<ConsolidatedWeather>
  public let sunRise: String
  public let sunSet: String
  
  public init(
    id: String,
    consolidateWeather: Array<ConsolidatedWeather>,
    sunRise: String,
    sunSet: String
  ) {
    self.id = id
    self.consolidateWeather = consolidateWeather
    self.sunRise = sunRise
    self.sunSet = sunSet
  }
}

public struct ConsolidatedWeather: Equatable {
  public let applicableDate: Date
  public let maxTemp: Double
  public let minTemp: Double
  public let theTemp: Double
  public let weatherStateName: String?
  
  public init(
    applicableDate: Date,
    maxTemp: Double,
    minTemp: Double,
    theTemp: Double,
    weatherStateName: String?
  ) {
    self.applicableDate = applicableDate
    self.maxTemp = maxTemp
    self.minTemp = minTemp
    self.theTemp = theTemp
    self.weatherStateName = weatherStateName
  }
}
