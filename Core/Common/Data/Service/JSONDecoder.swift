//
//  JSONDecoder.swift
//  CommonData_iOS
//
//  Created by 조요한 on 2021/12/03.
//

import Foundation

public let jsonDecoder: JSONDecoder = {
  let d = JSONDecoder()
  let formatter = DateFormatter()
  formatter.dateFormat = "yyyy-MM-dd"
  formatter.calendar = Calendar(identifier: .iso8601)
  formatter.timeZone = TimeZone(secondsFromGMT: 0)
  formatter.locale = Locale(identifier: "en_US_POSIX")
  d.dateDecodingStrategy = .formatted(formatter)
  return d
}()
