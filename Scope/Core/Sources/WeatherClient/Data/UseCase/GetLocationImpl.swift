//
//  GetLocationImpl.swift
//  WeatherClient_iOS
//
//  Created by 조요한 on 2021/12/03.
//

import Combine
import ComposableArchitecture
import ScopeCore

struct GetLoactionImpl: GetLocation {
  func execute(query: String) -> AnyPublisher<Array<Location>, Error> {
    var components = URLComponents(string: "https://www.metaweather.com/api/location/search")!
    components.queryItems = [URLQueryItem(name: "query", value: query)]
    
    return URLSession.shared.dataTaskPublisher(for: components.url!)
      .map { data, _ in data }
      .decode(type: [LocationDTO].self, decoder: jsonDecoder)
      .map { $0.map { translator($0)} }
      .eraseToAnyPublisher()
  }
}
