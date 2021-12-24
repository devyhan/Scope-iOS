//
//  GetWeatherImpl.swift
//  CommonData_iOS
//
//  Created by 조요한 on 2021/12/01.
//

import Combine
import Foundation

struct GetWeatherImpl: GetWeather {
  func execute(id: String) -> AnyPublisher<LocationWeather, Error> {
    let url = URL(string: "https://www.metaweather.com/api/location/\(id)")!
    
    return URLSession.shared.dataTaskPublisher(for: url)
      .map { data, _ in data } 
      .decode(type: LocationWeatherDTO.self, decoder: jsonDecoder)
      .map { translator($0) }
      .eraseToAnyPublisher()
  }
}
