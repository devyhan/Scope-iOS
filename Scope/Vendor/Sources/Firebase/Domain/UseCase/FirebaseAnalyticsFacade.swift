//
//  FirebaseAnalyticsFacade.swift
//  Vendor
//
//  Created by 조요한 on 2021/12/17.
//  Copyright © 2021 com.devyhan93.scope. All rights reserved.
//

public protocol FirebaseAnalyticsFacade {
  func logEvent(event: AppLogEvent)
  func logEvent(event: AppLogEvent, attr: AppLogEventAttribute...)
  func logEvent(event: AppLogEvent, attr: [AppLogEventAttribute])
}
