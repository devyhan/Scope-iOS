//
//  FirebaseCore.swift
//  Vendor
//
//  Created by 조요한 on 2021/12/17.
//  Copyright © 2021 com.devyhan93.scope. All rights reserved.
//

public final class FirebaseCore: Core {
  public var registerFacade: RegisterFacade
  public var analyticsFacade: AnalyticsFacade
  
  public init() {
    self.registerFacade = RegisterFacadeImpl()
    self.analyticsFacade = AnalyticsFacadeImpl()
  }
}
