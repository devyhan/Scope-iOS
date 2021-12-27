//
//  AppDelegate.swift
//  App
//
//  Created by 조요한 on 2021/12/27.
//  Copyright © 2021 com.devyhan93.scope. All rights reserved.
//

import SwiftUI
import Vendor

class AppDelegate: NSObject, UIApplicationDelegate {
  private let firebase: Vendor.Core = FirebaseCore()
  
  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    firebase.registerFacade.register(bundle: Bundle.module, scheme: "Dev")
    return true
  }
}
