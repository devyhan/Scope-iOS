//
//  Translator.swift
//  CommonData_iOS
//
//  Created by 조요한 on 2021/12/03.
//

import Combine

func translator(_ dto: LocationDTO) -> Location {
  let id = "\(dto.id)"
  let title = dto.title
  
  return .init(
    id: id,
    title: title
  )
}

func translator(_ dto: LocationWeatherDTO) -> LocationWeather {
  let id = "\(dto.id)"
  let consolidateWeather: [ConsolidatedWeather] = dto.consolidatedWeather.map {
    ConsolidatedWeather(
      applicableDate: $0.applicableDate,
      maxTemp: $0.maxTemp,
      minTemp: $0.minTemp,
      theTemp: $0.theTemp,
      weatherStateName: $0.weatherStateName
    )
  }
  let sunRise = dto.sunRise
  let sunSet = dto.sunSet
  
  return .init(
    id: id,
    consolidateWeather: consolidateWeather,
    sunRise: sunRise,
    sunSet: sunSet
  )
}

