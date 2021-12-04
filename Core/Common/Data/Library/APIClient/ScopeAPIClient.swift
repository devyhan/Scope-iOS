//
//  ScopeAPIClient.swift
//  CommonData_iOS
//
//  Created by 조요한 on 2021/11/26.
//

import Combine
import Alamofire

//public final class BaseAPIClient: APIClient {
//  public private(set) var baseHeaders: [String: String] = [:]
//  private let apiServerUrl: String
//  private let apiVersion: String?
//  private var cancellables = Set<AnyCancellable>()
//
//  public var authorization: Authorization = .anonymous {
//    didSet {
//      switch authorization {
//      case .anonymous:
//        baseHeaders["Authorization"] = ""
//      case let .signedIn(token):
//        baseHeaders["Authorization"] = "Bearer \(token)"
//      }
//    }
//  }
//
//  public init(
//    apiServerUrl: String,
//    apiVersion: String? = "latest",
//    apiCredential: APICredentialReader = AnonymousAPICredential()
//  ) {
//    self.apiServerUrl = apiServerUrl
//    self.apiVersion = apiVersion
//    baseHeaders["User-Agent"] = .userAgent
//    apiCredential.source
//      .sink(
//        receiveValue: {
//          if let credential = $0 {
//            self.authorization = .signedIn(token: credential.accessToken)
//          } else {
//            self.authorization = .anonymous
//          }
//        })
//      .store(in: &cancellables)
//  }
//
//  public func buildRequest(
//    method: Alamofire.HTTPMethod,
//    url: Alamofire.URLConvertible
//  ) -> RequestBuilderType {
//    return buildRequest(
//      method: method,
//      url: url,
//      encoding: JSONEncoding.default,
//      skipVersion: false
//    )
//  }
//
//  public func buildRequest(
//    method: Alamofire.HTTPMethod,
//    url: Alamofire.URLConvertible,
//    encoding: ParameterEncoding
//  ) -> RequestBuilderType {
//    return buildRequest(
//      method: method,
//      url: url,
//      encoding: encoding,
//      skipVersion: false
//    )
//  }
//
//  public func buildRequest(
//    method: HTTPMethod,
//    url: URLConvertible,
//    encoding: ParameterEncoding = JSONEncoding.default,
//    skipVersion: Bool = false
//  ) -> RequestBuilderType {
//    let requestUrl: String = {
//      guard let apiVersion = apiVersion else {
//        return "\(apiServerUrl)\(url)"
//      }
//      return skipVersion ? "\(apiServerUrl)\(url)" : "\(apiServerUrl)/\(apiVersion)\(url)"
//    }()
//
//    return RequestBuilder(
//      method: method,
//      url: requestUrl,
//      encoding: encoding,
//      headers: baseHeaders,
//      parameterEncoder: .forHolixApi,
//      resultDecoder: .forHolixApi
//    )
//  }
//}
