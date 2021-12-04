//
//  GetLocationImpl.swift
//  WeatherClient_iOS
//
//  Created by 조요한 on 2021/12/03.
//

import Combine
import ComposableArchitecture
import CommonData
import WeatherClient

struct GetLoactionImpl: GetLocation {
  func execute(query: String) -> AnyPublisher<Array<Location>, Error> {
    var components = URLComponents(string: "https://www.metaweather.com/api/location/search")!
    components.queryItems = [URLQueryItem(name: "query", value: query)]

    return URLSession.shared.dataTaskPublisher(for: components.url!)
      .map { data, _ in data }
      .decode(type: [LocationDTO].self, decoder: jsonDecoder)
      .map { $0.map { translator($0)} }
//      .mapError { _ in Failure() }
      .eraseToAnyPublisher()
  }
}


//extension Array {
//    func customMap<U>(f: (Element) -> U) -> [U] {
//        var result = [U]()
//
//        for x in self {
//            result.append(f(x))
//        }
//
//        return result
//    }
//}
//
//extension Publisher {
//  func translate<T, R>(dto: T, type: R) -> AnyPublisher<Self.Output, Self.Failure>
//        where T: Publisher, T.Output: Equatable, T.Failure == Self.Failure {
////        combineLatest(dto)
////            .removeDuplicates(by: {
////                (first, second) -> Bool in
////                first.1 == second.1
////            })
////            .map { first in
////                first.0
////        }
//
//          Just(dto)
//            .map {
//              $0.map { R }
//            }
//        .eraseToAnyPublisher()
//    }
//}
