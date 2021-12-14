//
//  LocationWeatherDTO.swift
//  WeatherClient_iOS
//
//  Created by 조요한 on 2021/12/03.
//

import Foundation

public struct LocationWeatherDTO: Decodable, Equatable {
  public let consolidatedWeather: [ConsolidatedWeather]
  public let id: Int
  public let sunRise: String
  public let sunSet: String

  public struct ConsolidatedWeather: Decodable, Equatable {
    public let applicableDate: Date
    public let maxTemp: Double
    public let minTemp: Double
    public let theTemp: Double
    public let weatherStateName: String?
  }
}

extension LocationWeatherDTO {
  private enum CodingKeys: String, CodingKey {
    case consolidatedWeather = "consolidated_weather"
    case id = "woeid"
    case sunRise = "sun_rise"
    case sunSet = "sun_set"
  }
}

extension LocationWeatherDTO.ConsolidatedWeather {
  private enum CodingKeys: String, CodingKey {
    case applicableDate = "applicable_date"
    case maxTemp = "max_temp"
    case minTemp = "min_temp"
    case theTemp = "the_temp"
    case weatherStateName = "weather_state_name"
  }
}

//{
//"consolidated_weather":[
//{
//"id":4580134586679296,
//"weather_state_name":"Light Rain",
//"weather_state_abbr":"lr",
//"wind_direction_compass":"W",
//"created":"2021-12-01T12:59:01.038057Z",
//"applicable_date":"2021-12-01",
//"min_temp":3.395,
//"max_temp":11.175,
//"the_temp":8.92,
//"wind_speed":10.27108271968769,
//"wind_direction":274.00183529164,
//"air_pressure":997.5,
//"humidity":73,
//"visibility":8.590767418277261,
//"predictability":75
//},
//{
//"id":6386287880699904,
//"weather_state_name":"Light Cloud",
//"weather_state_abbr":"lc",
//"wind_direction_compass":"NW",
//"created":"2021-12-01T12:59:01.460305Z",
//"applicable_date":"2021-12-02",
//"min_temp":0.74,
//"max_temp":4.865,
//"the_temp":3.87,
//"wind_speed":8.845123792422916,
//"wind_direction":317.6667720173256,
//"air_pressure":1012.0,
//"humidity":63,
//"visibility":13.487172413107452,
//"predictability":70
//},
//{
//"id":5067756677365760,
//"weather_state_name":"Heavy Rain",
//"weather_state_abbr":"hr",
//"wind_direction_compass":"SW",
//"created":"2021-12-01T12:59:01.170432Z",
//"applicable_date":"2021-12-03",
//"min_temp":0.865,
//"max_temp":8.754999999999999,
//"the_temp":8.33,
//"wind_speed":7.002384029637582,
//"wind_direction":220.70632145621818,
//"air_pressure":1003.0,
//"humidity":90,
//"visibility":8.277596337389644,
//"predictability":77
//},
//{
//"id":5999325889953792,
//"weather_state_name":"Light Rain",
//"weather_state_abbr":"lr",
//"wind_direction_compass":"W",
//"created":"2021-12-01T12:59:00.765930Z",
//"applicable_date":"2021-12-04",
//"min_temp":4.825,
//"max_temp":7.38,
//"the_temp":7.0,
//"wind_speed":9.998976003544632,
//"wind_direction":275.3309196185259,
//"air_pressure":999.5,
//"humidity":70,
//"visibility":13.375946969696969,
//"predictability":75
//},
//{
//"id":5105706270195712,
//"weather_state_name":"Heavy Cloud",
//"weather_state_abbr":"hc",
//"wind_direction_compass":"NW",
//"created":"2021-12-01T12:59:00.769889Z",
//"applicable_date":"2021-12-05",
//"min_temp":2.52,
//"max_temp":6.805,
//"the_temp":6.359999999999999,
//"wind_speed":8.075624220888677,
//"wind_direction":317.3310915578502,
//"air_pressure":1011.5,
//"humidity":70,
//"visibility":14.745759762984171,
//"predictability":71
//},
//{
//"id":6561643342331904,
//"weather_state_name":"Showers",
//"weather_state_abbr":"s",
//"wind_direction_compass":"SW",
//"created":"2021-12-01T12:59:04.240951Z",
//"applicable_date":"2021-12-06",
//"min_temp":1.4549999999999998,
//"max_temp":6.325,
//"the_temp":5.08,
//"wind_speed":3.8762785333651473,
//"wind_direction":229.49999999999997,
//"air_pressure":1022.0,
//"humidity":73,
//"visibility":9.999726596675416,
//"predictability":73
//}
//],
//"time":"2021-12-01T14:30:10.157358Z",
//"sun_rise":"2021-12-01T07:44:01.570240Z",
//"sun_set":"2021-12-01T15:54:51.354677Z",
//"timezone_name":"LMT",
//"parent":{
//"title":"England",
//"location_type":"Region / State / Province",
//"woeid":24554868,
//"latt_long":"52.883560,-1.974060"
//},
//"sources":[
//{
//"title":"BBC",
//"slug":"bbc",
//"url":"http://www.bbc.co.uk/weather/",
//"crawl_rate":360
//},
//{
//"title":"Forecast.io",
//"slug":"forecast-io",
//"url":"http://forecast.io/",
//"crawl_rate":480
//},
//{
//"title":"HAMweather",
//"slug":"hamweather",
//"url":"http://www.hamweather.com/",
//"crawl_rate":360
//},
//{
//"title":"Met Office",
//"slug":"met-office",
//"url":"http://www.metoffice.gov.uk/",
//"crawl_rate":180
//},
//{
//"title":"OpenWeatherMap",
//"slug":"openweathermap",
//"url":"http://openweathermap.org/",
//"crawl_rate":360
//},
//{
//"title":"Weather Underground",
//"slug":"wunderground",
//"url":"https://www.wunderground.com/?apiref=fc30dc3cd224e19b",
//"crawl_rate":720
//},
//{
//"title":"World Weather Online",
//"slug":"world-weather-online",
//"url":"http://www.worldweatheronline.com/",
//"crawl_rate":360
//}
//],
//"title":"London",
//"location_type":"City",
//"woeid":44418,
//"latt_long":"51.506321,-0.12714",
//"timezone":"Europe/London"
//}
