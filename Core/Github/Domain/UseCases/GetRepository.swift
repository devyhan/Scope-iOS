//
//  GetRepository.swift
//  CommonData_iOS
//
//  Created by 조요한 on 2021/11/26.
//

import Combine

//public protocol GetRepository {
//  func execute(query: String, page: Int) -> AnyPublisher<[Repository], Error>
//}

public struct GithubSearchResult<T: Codable>: Codable {
  public let items: [T]
}

public struct Repository: Codable, Identifiable, Equatable {
  public let id: Int
  public let name: String
  public let description: String?
  public let stargazers_count: Int
}
