//
//  LocationDTO.swift
//  WeatherClient_iOS
//
//  Created by 조요한 on 2021/12/03.
//

public struct LocationDTO: Decodable, Equatable {
  public let id: Int
  public let title: String
  public let locationType: String
  public let lattLong: String
}

extension LocationDTO {
  private enum CodingKeys: String, CodingKey {
    case title
    case id = "woeid"
    case lattLong = "latt_long"
    case locationType = "location_type"
  }
}

//[
//  {
//    "title": "Seoul",
//    "location_type": "City",
//    "woeid": 1132599,
//    "latt_long": "37.557121,126.977379"
//  }
//]

