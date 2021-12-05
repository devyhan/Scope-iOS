//
//  AppState.swift
//  Application_iOS
//
//  Created by 조요한 on 2021/12/05.
//

import Foundation

struct AppState: Equatable {
  var scopes: [String] = Scopes.allCases.map { $0.rawValue }
}
