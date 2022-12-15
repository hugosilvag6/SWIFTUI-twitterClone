//
//  TextArea.swift
//  TwitterCloneSwiftUI
//
//  Created by Hugo Silva on 12/12/22.
//

import SwiftUI

struct TextArea: View {
   
   @Binding var text: String
   let placeholder: String
   
   init(text: Binding<String>, placeholder: String) {
      self._text = text
      self.placeholder = placeholder
   }
   
    var body: some View {
       ZStack (alignment: .topLeading) {
          
          TextEditor(text: $text)
             .padding(4)
          if text.isEmpty {
             Text(placeholder)
                .foregroundColor(Color(.placeholderText))
                .padding(.horizontal, 8)
                .padding(.vertical, 12)
                .allowsHitTesting(false)
          }
       }
       .font(.body)
    }
}

struct TextArea_Previews: PreviewProvider {
    static var previews: some View {
       TextArea(text: .constant(""), placeholder: "Caption")
    }
}
