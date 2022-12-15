//
//  CustomTextField.swift
//  TwitterCloneSwiftUI
//
//  Created by Hugo Silva on 12/12/22.
//

import SwiftUI

struct CustomTextField: View {
   
   @Binding var text: String
   let placeholder: String
   let imageName: String
   
    var body: some View {
       ZStack(alignment: .leading) {
          if text.isEmpty {
             Text(placeholder)
                .foregroundColor(.init(white: 1, opacity: 0.87))
                .padding(.leading, 40)
          }
          HStack (spacing: 16) {
             Image(systemName: imageName)
                .resizable()
                .scaledToFit()
                .frame(width: 20, height: 20)
                .foregroundColor(.white)
             TextField("", text: $text)
          }
       }
    }
}

struct CustomTextField_Previews: PreviewProvider {
    static var previews: some View {
       CustomTextField(text: .constant(""), placeholder: "Email", imageName: "envelope")
          .background(Color.red)
    }
}
