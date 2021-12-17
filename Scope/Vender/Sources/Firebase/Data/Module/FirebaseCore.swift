//
//  FirebaseCore.swift
//  Vender
//
//  Created by 조요한 on 2021/12/17.
//  Copyright © 2021 com.devyhan93.scope. All rights reserved.
//

public final class FirebaseCore: Core {
  public var firebaseRegisterFacade: FirebaseRegisterFacade
  public var firebaseAnalyticsFacade: FirebaseAnalyticsFacade
  
  public init() {
    self.firebaseRegisterFacade = FirebaseRegisterFacadeImpl()
    self.firebaseAnalyticsFacade = FirebaseAnalyticsFacadeImpl()
  }
}
