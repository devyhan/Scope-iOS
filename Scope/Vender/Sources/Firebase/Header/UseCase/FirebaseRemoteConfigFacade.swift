//
//  FirebaseRemoteConfigFacade.swift
//  Vender
//
//  Created by 조요한 on 2021/12/22.
//  Copyright © 2021 com.devyhan93.scope. All rights reserved.
//

import Combine
import Foundation

public protocol FirebaseRemoteConfigFacade {
  var getRequiredVersion: AnyPublisher<String?, Never> { get }
  var getOptionalVersion: AnyPublisher<String?, Never> { get }
}
