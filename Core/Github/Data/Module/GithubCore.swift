//
//  GithubCore.swift
//  CommonData_iOS
//
//  Created by 조요한 on 2021/11/27.
//

import Github
import Common

public final class GithubCore: Core {
  public var gitRepository: GitRepository
  public var apiClient: APIClient
  
  public init(
    gitRepository: GitRepository,
    apiClient: APIClient
  ) {
    gitRepository = GitRepositoryImpl(apiClient: apiClient)
  }
}
