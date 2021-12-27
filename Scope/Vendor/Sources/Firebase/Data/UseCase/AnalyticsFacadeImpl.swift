//
//  AnalyticsFacadeImpl.swift
//  Vendor
//
//  Created by 조요한 on 2021/12/17.
//  Copyright © 2021 com.devyhan93.scope. All rights reserved.
//

import FirebaseAnalytics

final class AnalyticsFacadeImpl: AnalyticsFacade {
  func logEvent(event: AppLogEvent) {
    logEvent(event: event, attr: [])
  }
  
  func logEvent(event: AppLogEvent, attr: AppLogEventAttribute...) {
    logEvent(event: event, attr: attr)
  }
  
  func logEvent(event: AppLogEvent, attr: [AppLogEventAttribute]) {
    var dict: [String: Any] = [:]
    attr.forEach { dict.merge($0.analyticsParameter) { _, new in new } }
    Analytics.logEvent(event.rawValue, parameters: dict)
  }
}
