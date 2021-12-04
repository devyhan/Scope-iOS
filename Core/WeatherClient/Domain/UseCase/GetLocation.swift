//
//  GetLocation.swift
//  WeatherClient_iOS
//
//  Created by 조요한 on 2021/12/03.
//

import Combine

public protocol GetLocation {
  func execute(query: String) -> AnyPublisher<Array<Location>, Error>
}

public enum Failure: Error, Equatable {}
