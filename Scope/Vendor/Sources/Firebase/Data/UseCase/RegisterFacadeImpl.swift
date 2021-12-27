//
//  RegisterFacadeImpl.swift
//  Vendor
//
//  Created by 조요한 on 2021/12/14.
//  Copyright © 2021 com.devyhan93.scope. All rights reserved.
//

import FirebaseAnalytics
import FirebaseCore

final class RegisterFacadeImpl: RegisterFacade {
  func register(bundle: Bundle, scheme: String) {
    bundle.path(forResource: "GoogleService-Info", ofType: "plist")
      .flatMap { FirebaseOptions(contentsOfFile: $0) }
      .flatMap { FirebaseApp.configure(options: $0) }
  }
}
