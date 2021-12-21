//
//  Core.swift
//  Vendor
//
//  Created by 조요한 on 2021/12/17.
//  Copyright © 2021 com.devyhan93.scope. All rights reserved.
//

import Foundation

public protocol Core {
  var firebaseRegisterFacade: FirebaseRegisterFacade { get }
  var firebaseAnalyticsFacade: FirebaseAnalyticsFacade { get }
}
