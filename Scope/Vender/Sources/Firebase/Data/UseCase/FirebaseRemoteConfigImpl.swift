//
//  FirebaseRemoteConfigImpl.swift
//  Vender
//
//  Created by 조요한 on 2021/12/22.
//  Copyright © 2021 com.devyhan93.scope. All rights reserved.
//

import Combine
import Common
import FirebaseCore
import FirebaseRemoteConfig

final class FirebaseRemoteConfigFacadeImpl: FirebaseRemoteConfigFacade {
  private let configureProperty: PassthroughSubject<Void, Error> = .init()
  private let activatedProperty: CurrentValueSubject<Bool, Error> = .init(false)
  private var activated: AnyPublisher<Void, Error> {
    return activatedProperty
      .filter { $0 }
      .prefix(1)
      .map { _ in () }
      .eraseToAnyPublisher()
  }
  
  private var cancellables = Set<AnyCancellable>()
  
  init() {
    configureProperty
      .flatMap { RemoteConfig.remoteConfig().combined.fetchAndActivate() }
      .map { _ in true }
      .sink(
        receiveCompletion: { _ in self.activatedProperty.send(false) },
        receiveValue: { self.activatedProperty.send($0) }
      )
      .store(in: &cancellables)
  }
  
  private func configValue(_ key: String) -> AnyPublisher<RemoteConfigValue, Error> {
    activated
      .map { RemoteConfig.remoteConfig().configValue(forKey: key) }
      .eraseToAnyPublisher()
  }
  
  public func configure(minimumFetchInterval: TimeInterval) {
    let settings = RemoteConfigSettings()
    settings.minimumFetchInterval = minimumFetchInterval
    RemoteConfig.remoteConfig().configSettings = settings
    configureProperty.send(())
  }
  
  public func activate() {
    RemoteConfig.remoteConfig().combined.fetchAndActivate()
      .sink(
        receiveCompletion: { _ in },
        receiveValue: { self.activatedProperty.send(true) }
      )
      .store(in: &cancellables)
  }
  
  var getRequiredVersion: AnyPublisher<String?, Never> {
    configValue("required_version")
      .map { $0.stringValue }
      .replaceError(with: nil)
      .eraseToAnyPublisher()
  }
  
  var getOptionalVersion: AnyPublisher<String?, Never> {
    configValue("optional_version")
      .map { $0.stringValue }
      .replaceError(with: nil)
      .eraseToAnyPublisher()
  }
}

extension Combined where Base: RemoteConfig {
  public func fetchAndActivate() -> Future<Void, Error> {
    return Future { promise in
      self.base.fetchAndActivate { (_, error) -> Void in
        guard let error = error else {
          promise(.success(()))
          return
        }
        print("RemoteConfig Fetch Failed: \(error.localizedDescription)")
        promise(.failure(error))
      }
    }
  }
}
