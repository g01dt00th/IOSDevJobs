//
//  SignInWithApple.swift
//  IOSDevJobs
//
//  Created by Роенко Денис on 16.09.2020.
//  Copyright © 2020 Denis Roenko. All rights reserved.
//

import SwiftUI
import AuthenticationServices

// 1
final class SignInWithApple: UIViewRepresentable {
  // 2
  func makeUIView(context: Context) -> ASAuthorizationAppleIDButton {
    // 3
    return ASAuthorizationAppleIDButton()
  }
  
  // 4
  func updateUIView(_ uiView: ASAuthorizationAppleIDButton, context: Context) {
  }
}
