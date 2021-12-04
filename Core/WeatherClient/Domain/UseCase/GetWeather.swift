//
//  GetWeather.swift
//  CommonData_iOS
//
//  Created by 조요한 on 2021/12/01.
//

import Combine
import CommonData

public protocol GetWeather {
  func execute(id: String) -> AnyPublisher<LocationWeather, Error>
}

//// MARK: - API models
//struct Location: Decodable, Equatable {
//  var id: Int
//  var title: String
//}
//

//
//struct Failure: Error, Equatable {}
//
//// MARK: - API client interface
//// Typically this interface would live in its own module, separate from the live implementation.
//// This allows the search feature to compile faster since it only depends on the interface.
//public protocol WeatherClient {
//  var searchLocation: (String) -> Effect<[Location], Failure> { get }
//  var weather: (Int) -> Effect<LocationWeather, Failure> { get }
//}
//
//// MARK: - Live API implementation
//// Example endpoints:
////   https://www.metaweather.com/api/location/search/?query=san
////   https://www.metaweather.com/api/location/2487956/
//extension WeatherClient {
//  public static let live = WeatherClient(
//    searchLocation: { query in
//      var components = URLComponents(string: "https://www.metaweather.com/api/location/search")!
//      components.queryItems = [URLQueryItem(name: "query", value: query)]
//
//      return URLSession.shared.dataTaskPublisher(for: components.url!)
//        .map { data, _ in data }
//        .decode(type: [Location].self, decoder: jsonDecoder)
//        .mapError { _ in Failure() }
//        .eraseToEffect()
//    },
//    weather: { id in
//      let url = URL(string: "https://www.metaweather.com/api/location/\(id)")!
//
//      return URLSession.shared.dataTaskPublisher(for: url)
//        .map { data, _ in data }
//        .decode(type: LocationWeather.self, decoder: jsonDecoder)
//        .mapError { _ in Failure() }
//        .eraseToEffect()
//    })
//}
//
//// MARK: - Mock API implementations
//extension WeatherClient {
//  static let failing = Self(
//    searchLocation: { _ in .failing("WeatherClient.searchLocation") },
//    weather: { _ in .failing("WeatherClient.weather") }
//  )
//}
//
//// MARK: - Private helpers
//private let jsonDecoder: JSONDecoder = {
//  let d = JSONDecoder()
//  let formatter = DateFormatter()
//  formatter.dateFormat = "yyyy-MM-dd"
//  formatter.calendar = Calendar(identifier: .iso8601)
//  formatter.timeZone = TimeZone(secondsFromGMT: 0)
//  formatter.locale = Locale(identifier: "en_US_POSIX")
//  d.dateDecodingStrategy = .formatted(formatter)
//  return d
//}()
//
//extension Location {
//  private enum CodingKeys: String, CodingKey {
//    case id = "woeid"
//    case title
//  }
//}
//

