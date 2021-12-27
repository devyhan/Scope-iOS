//
//  RemoteConfigFacadeImpl.swift
//  Vendor
//
//  Created by 조요한 on 2021/12/27.
//  Copyright © 2021 com.devyhan93.scope. All rights reserved.
//

import Combine
import Common
import FirebaseCore
import FirebaseRemoteConfig

final class RemoteConfigFacadeImpl: RemoteConfigFacade {
  private var remoteConfig: RemoteConfig
  private let version = PassthroughSubject<String, Never>()
  
  init() {
    self.remoteConfig = RemoteConfig.remoteConfig()
    let setting = RemoteConfigSettings()
    setting.minimumFetchInterval = 0 // 배포 환경에서 설정값 (5 * 60)로 설정
    remoteConfig.configSettings = setting
  }
  
  func execute(key: String, scheme: String) -> AnyPublisher<String, Never> {
    remoteConfig.fetch { (status, error) -> Void in
      if status == .success {
        self.remoteConfig.activate() { (changed, error) in
          guard let requierdVersion: String = self.getVariantObj(key, scheme) else { return }
          self.version.send(requierdVersion)
        }
      } else {
        print("Error: \(error?.localizedDescription ?? "No error available.")")
      }
    }
    
    return version.eraseToAnyPublisher()
  }
  
  private func getVariantObj<R: Codable>(_ key: String, _ scheme: String) -> R? {
      let config: Dictionary<String, R>? = remoteConfig
          .configValue(forKey: key).dataValue.fromJson()
      return config?[scheme]
  }
}
