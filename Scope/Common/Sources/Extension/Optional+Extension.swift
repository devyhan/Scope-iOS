//
//  Optional+Extension.swift
//  Common
//
//  Created by 조요한 on 2021/12/27.
//  Copyright © 2021 com.devyhan93.scope. All rights reserved.
//

import Foundation

public extension Optional {
  var isNil: Bool {
    guard case Optional.none = self else {
      return false
    }
    return true
  }
}
