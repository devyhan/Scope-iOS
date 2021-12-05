//
//  AppAction.swift
//  Application_iOS
//
//  Created by 조요한 on 2021/12/05.
//

import Foundation
import WeatherClient

enum AppAction {
  case locationTapped(Location)
  case searchQueryChanged(String)
  case locationWeatherResponse(Result<LocationWeather, Error>)
  case locationsResponse(Result<[Location], Error>)
  case commitScope(Scopes)
}
