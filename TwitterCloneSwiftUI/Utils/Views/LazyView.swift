//
//  LazyView.swift
//  TwitterCloneSwiftUI
//
//  Created by Hugo Silva on 15/12/22.
//

import SwiftUI

struct LazyView<Content: View>: View {
   let build: () -> Content
   init(_ build: @autoclosure @escaping() -> Content) {
      self.build = build
   }
   
   var body: Content {
      build()
   }
}
