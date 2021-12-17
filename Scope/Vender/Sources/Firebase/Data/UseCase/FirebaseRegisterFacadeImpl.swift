//
//  FirebaseRegisterFacade.swift
//  Vender
//
//  Created by 조요한 on 2021/12/14.
//  Copyright © 2021 com.devyhan93.scope. All rights reserved.
//

import FirebaseAnalytics
import FirebaseCore

struct FirebaseRegisterFacadeImpl: FirebaseRegisterFacade {
  func register(bundle: Bundle, plistName: String) {
    bundle.path(forResource: plistName, ofType: "plist")
      .flatMap { FirebaseOptions(contentsOfFile: $0) }
      .flatMap { FirebaseApp.configure(options: $0) }
  }
}

//public protocol FirebaseFacadeType {
//    var scheme: String { get }
//    func configure()
//}

//public class FirebaseFacade: FirebaseFacadeType {
//    public var scheme: String
//
//    public init(scheme: String) {
//        self.scheme = scheme
//    }
//
//    public func configure() {
//        FirebaseApp.configure(
//            name: scheme,
//            options: firebaseOptions()
//        )
//    }
//
//    private func firebaseOptions() -> FirebaseOptions {
//        let bundle = Bundle(for: Self.self)
//        let filePath = bundle.path(
//            forResource: "GoogleService-\(scheme)",
//            ofType: "plist"
//        )
//
//        guard let options = FirebaseOptions(contentsOfFile: filePath!) else {
//            fatalError("\(scheme) firebase app's option file(.plist) could not be found")
//        }
//
//        return options
//    }
//}
