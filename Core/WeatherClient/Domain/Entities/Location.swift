//
//  Location.swift
//  CommonData_iOS
//
//  Created by 조요한 on 2021/12/03.
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
