//
//  ChatView.swift
//  TwitterCloneSwiftUI
//
//  Created by Hugo Silva on 08/12/22.
//

import SwiftUI

struct ChatView: View {
   let user: User
   @ObservedObject var viewModel: ChatViewModel
   @State var messageText: String = ""
   
   init(user: User) {
      self.user = user
      self.viewModel = ChatViewModel(user: user)
   }
   
    var body: some View {
       VStack {
          ScrollView {
             VStack (alignment: .leading, spacing: 12) {
                ForEach(viewModel.messages) { message in
                   MessageView(message: message)
                }
             }
          }.padding(.top)
          MessageInputView(messageText: $messageText, action: sendMessage)
             .padding()
       }.navigationTitle(user.username)
    }
   
   func sendMessage() {
      viewModel.sendMessage(messageText)
      messageText = ""
   }
}

struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
       ChatView(user: User(dictionary: [:]))
    }
}
