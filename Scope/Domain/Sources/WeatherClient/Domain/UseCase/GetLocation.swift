//
//  GetLocation.swift
//  WeatherClient_iOS
//
//  Created by ์กฐ์ํ on 2021/12/03.
//

import Combine

public protocol GetLocation {
  func execute(query: String) -> AnyPublisher<Array<Location>, Error>
}

public enum Failure: Error, Equatable {}
