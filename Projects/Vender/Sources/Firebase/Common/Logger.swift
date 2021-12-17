//
//  Logger.swift
//  Vender
//
//  Created by 조요한 on 2021/12/17.
//  Copyright © 2021 com.devyhan93.scope. All rights reserved.
//

import FirebaseAnalytics

// logger

public class Logger {}

extension Logger {
    public final class Firebase {
        static var service: FirebaseAnalyticsFacade = FirebaseAnalyticsFacadeImpl()
    }
}

extension Logger.Firebase {
    public static func logEvent(event: AppLogEvent) {
        service.logEvent(event: event)
    }

    public static func logEvent(event: AppLogEvent, attr: AppLogEventAttribute...) {
        service.logEvent(event: event, attr: attr)
    }

    public static func logEvent(event: AppLogEvent, attr: [AppLogEventAttribute]) {
        service.logEvent(event: event, attr: attr)
    }
}

// app log envent

public enum AppLogEvent: String {
    case appStart
}

extension AppLogEvent {
    public var rawValue: String {
        switch self {
        case .appStart: return "AppStart"
        }
    }
}

// app log event attribute

public enum AppLogEventAttribute {
    case itemId(String)
    case itemName(String)
    case contentType(String)
}

extension AppLogEventAttribute {
    var analyticsParameter: [String: Any] {
        switch self {
        case .itemId(let value):
            return [AnalyticsParameterItemID: value]
        case .itemName(let value):
            return [AnalyticsParameterItemName: value]
        case .contentType(let value):
            return [AnalyticsParameterContentType: value]
        }
    }
}
