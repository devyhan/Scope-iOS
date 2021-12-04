//
//  RequestBuilder.swift
//  CommonData_iOS
//
//  Created by 조요한 on 2021/11/26.
//

import Combine
import Alamofire

//public protocol RequestBuilderType {
//  func add<Parameters: Encodable & Equatable>(parameters: Parameters) -> Self
//  func add(headers: [String: String]) -> Self
//  func data() -> AnyPublisher<Data, Error>
//  func string(encoding: String.Encoding) -> AnyPublisher<String, Error>
//  func execute<Result: Decodable>(ofType: Result.Type?) -> AnyPublisher<Result, Error>
//  func execute() -> AnyPublisher<Void, Error>
//}
//
//public final class RequestBuilder: RequestBuilderType {
//  private let method: HTTPMethod
//  private let url: URLConvertible
//  private let encoding: ParameterEncoding
//  private var parameters: Encodable?
//  private var headers: [String: String]?
//
//  private let parameterEncoder: JSONEncoder
//  private let resultDecoder: JSONDecoder
//
//  private var cancellables = Set<AnyCancellable>()
//
//  public init(
//    method: HTTPMethod,
//    url: URLConvertible,
//    encoding: ParameterEncoding = JSONEncoding.default,
//    headers: [String: String]? = nil,
//    parameterEncoder: JSONEncoder = .init(),
//    resultDecoder: JSONDecoder = .init()
//  ) {
//    self.method = method
//    self.url = url
//    self.encoding = encoding
//    self.headers = headers
//    self.parameterEncoder = parameterEncoder
//    self.resultDecoder = resultDecoder
//  }
//
//  public func add<Parameters: Encodable>(parameters: Parameters) -> Self {
//    self.parameters = parameters
//    return self
//  }
//
//  public func add(headers: [String: String]) -> Self {
//    self.headers = (self.headers ?? [:]).withAllValuesFrom(headers)
//    return self
//  }
//
//  private func dataRequest() throws -> Alamofire.DataRequest {
//    let request = AF.request(
//      url,
//      method: method,
//      parameters: try parameters?.toJson(encoder: parameterEncoder),
//      encoding: encoding,
//      headers: headers.flatMap(HTTPHeaders.init)
//    )
//    .validate()
//    #if DEBUG
//      request.cURLDescription { print($0) }
//    #endif
//    return request
//  }
//
//  public func data() -> AnyPublisher<Data, Error> {
//    do {
//      let request = try dataRequest()
//      return Deferred {
//        Future { promise in
//          request.responseData { response in
//            let result = self.translate(resultFrom: response)
//            promise(result)
//          }
//        }
//      }
//      .eraseToAnyPublisher()
//    } catch {
//      return Deferred {
//        Future { promise in
//          promise(.failure(error))
//        }
//      }
//      .eraseToAnyPublisher()
//    }
//  }
//
//  public func string(encoding: String.Encoding = .utf8) -> AnyPublisher<String, Error> {
//    return data()
//      .compactMap { String(data: $0, encoding: encoding) }
//      .eraseToAnyPublisher()
//  }
//
//  public func execute<Result: Decodable>(ofType _: Result.Type? = nil) -> AnyPublisher<Result, Error> {
//    return data()
//      .tryMap { try self.resultDecoder.decode(Result.self, from: $0) }
//      .eraseToAnyPublisher()
//  }
//
//  public func execute() -> AnyPublisher<Void, Error> {
//    return data()
//      .tryMap { _ in () }
//      .catch { error -> Future<Void, Error> in
//        Future<Void, Error> { promise in
//          guard let afError = error as? AFError else {
//            return promise(.failure(error))
//          }
//          switch afError {
//          case let .responseSerializationFailed(reason):
//            switch reason {
//            case .inputDataNilOrZeroLength:
//              return promise(.success(()))
//            default:
//              break
//            }
//          default:
//            break
//          }
//          return promise(.failure(afError))
//        }
//      }
//      .eraseToAnyPublisher()
//  }
//
//  private func translate<Value>(resultFrom response: DataResponse<Value, AFError>) -> Result<Value, Error> {
//    switch response.result {
//    case let .success(value):
//      return .success(value)
//    case let .failure(error):
//      guard let httpError = translate(errorFor: response) else {
//        return .failure(error)
//      }
//      return .failure(httpError)
//    }
//  }
//
//  private func translate<Value>(
//    errorFor response: DataResponse<Value, AFError>
//  ) -> RequestBuilderHTTPError? {
//    switch response.response?.statusCode {
//    case 400:
//      return BadRequest(data: response.data, resultDecoder: resultDecoder)
//    case 401:
//      return Unauthorized(data: response.data, resultDecoder: resultDecoder)
//    case 403:
//      return PermissionDenied()
//    case 404:
//      return NotFound()
//    case 405:
//      return MethodNotAllowed()
//    case 500:
//      return InternalServerError()
//    case nil:
//      return HostNotFound()
//    default:
//      return nil
//    }
//  }
//}
//
//public protocol RequestBuilderHTTPError: Error {}
//
//public final class BadRequest: RequestBuilderHTTPError {
//  private let data: Data?
//  private let resultDecoder: JSONDecoder
//  public init(data: Data?, resultDecoder: JSONDecoder) {
//    self.data = data
//    self.resultDecoder = resultDecoder
//  }
//
//  public func body<Result: Decodable>() -> Result? {
//    guard let data = data else {
//      return nil
//    }
//    return try? resultDecoder.decode(Result.self, from: data)
//  }
//}
//
//public final class Unauthorized: RequestBuilderHTTPError {
//  private let data: Data?
//  private let resultDecoder: JSONDecoder
//  public init(data: Data?, resultDecoder: JSONDecoder) {
//    self.data = data
//    self.resultDecoder = resultDecoder
//  }
//
//  public func body<Result: Decodable>() -> Result? {
//    guard let data = data else {
//      return nil
//    }
//    return try? resultDecoder.decode(Result.self, from: data)
//  }
//}
//
//public final class PermissionDenied: RequestBuilderHTTPError {
//  public init() {}
//}
//
//public final class NotFound: RequestBuilderHTTPError {
//  public init() {}
//}
//
//public final class MethodNotAllowed: RequestBuilderHTTPError {
//  public init() {}
//}
//
//public final class InternalServerError: RequestBuilderHTTPError {
//  public init() {}
//}
//
//public final class HostNotFound: RequestBuilderHTTPError {
//  public init() {}
//}
