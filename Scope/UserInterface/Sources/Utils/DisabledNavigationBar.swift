//
//  DisabledNavigationBar.swift
//  UserInterface
//
//  Created by 조요한 on 2021/12/29.
//  Copyright © 2021 com.devyhan93.scope. All rights reserved.
//

import SwiftUI

private struct DisabledNavigationBar: ViewModifier {
  func body(content: Content) -> some View {
    content
      .navigationBarTitle("", displayMode: .inline)
      .navigationBarHidden(true)
  }
}

public extension View {
  func disabledNavigationBarStyle() -> some View {
    modifier(DisabledNavigationBar())
  }
}
