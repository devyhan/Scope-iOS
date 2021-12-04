//
//  GetRepositoryImpl.swift
//  CommonData_iOS
//
//  Created by 조요한 on 2021/11/26.
//

import Combine
import ComposableArchitecture

//struct GetRepositoryImpl: GetRepository {
//  private let apiClient: APIClient
//  private let pageSize = 10
//
//  init(apiClient: APIClient) {
//    apiClient = apiClient
//  }
//
//  func execute(query: String, page: Int) -> AnyPublisher<[Repository], Error> {
//    return apiClient.buildRequest(
//      method: .get,
//      url: "https://api.github.com/search/repositories?q=\(query)&sort=stars&per_page=\(pageSize)&page=\(page)"
//    )
//      .execute(ofType: GithubSearchResult<Repository>.self)
//      .map {
//        print($0)
//      }
//      .eraseToAnyPublisher()
//  }
//}

public protocol GetRepository {
  func execute(query: String, page: Int) -> Effect<[Repository], Error>
}

//protocol WeatherClients {
//  var searchLocation: (String) -> Effect<[Location], Failure> { get }

struct GitRepositoryImpl: GetRepository {

  func execute(query: String, page: Int) -> Effect<[Repository], Error> {
    
  }
  
  static let live = GitRepositoryImpl(
    
  )
}
