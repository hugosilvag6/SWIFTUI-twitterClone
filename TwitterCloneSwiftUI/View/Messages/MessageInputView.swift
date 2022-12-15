//
//  MessageInputView.swift
//  TwitterCloneSwiftUI
//
//  Created by Hugo Silva on 08/12/22.
//

import SwiftUI

struct MessageInputView: View {
   
   @Binding var messageText: String
   
    var body: some View {
       HStack {
          TextField("message", text: $messageText)
             .textFieldStyle(.plain)
             .frame(minHeight: 30)
          
          Button {
             //
          } label: {
             Text("Send")
          }

       }
    }
}

struct MessageInputView_Previews: PreviewProvider {
    static var previews: some View {
       MessageInputView(messageText: .constant(""))
    }
}
