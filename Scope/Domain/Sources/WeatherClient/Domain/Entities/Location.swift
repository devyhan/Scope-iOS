//
//  Location.swift
//  CommonData_iOS
//
//  Created by ์กฐ์ํ on 2021/12/03.
//

public struct Location: Equatable {
  public let id: String
  public let title: String
  
  public init(
    id: String,
    title: String
  ) {
    self.id = id
    self.title = title
  }
}
