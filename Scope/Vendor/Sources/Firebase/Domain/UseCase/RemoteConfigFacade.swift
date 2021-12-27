//
//  RemoteConfigFacade.swift
//  Vendor
//
//  Created by 조요한 on 2021/12/27.
//  Copyright © 2021 com.devyhan93.scope. All rights reserved.
//

import Combine

public protocol RemoteConfigFacade {
  func execute(key: String, scheme: String) -> AnyPublisher<String, Never>
}
