//
//  ConversationsView.swift
//  TwitterCloneSwiftUI
//
//  Created by Hugo Silva on 08/12/22.
//

import SwiftUI

struct ConversationsView: View {
   
   @State var isShowingNewMessageView = false
   @State var showChat = false
   
   var body: some View {
      ZStack (alignment: .bottomTrailing) {
         
         NavigationLink(destination: ChatView(), isActive: $showChat, label: {})
         
         ScrollView {
            VStack {
               ForEach(0..<9) { _ in
                  NavigationLink {
                     ChatView()
                  } label: {
                     ConversationCell()
                  }
               }
            }
            .padding()
         }
         
         Button {
            self.isShowingNewMessageView.toggle()
         } label: {
            Image(systemName: "envelope")
               .resizable()
               .scaledToFit()
               .frame(width: 32, height: 32)
               .padding()
         }
         .background(Color(.systemBlue))
         .foregroundColor(.white)
         .clipShape(Circle())
         .padding()
         .sheet(isPresented: $isShowingNewMessageView) {
            NewMessageView(show: $isShowingNewMessageView, startChat: $showChat)
         }
         
      }
   }
}

struct ConversationsView_Previews: PreviewProvider {
   static var previews: some View {
      ConversationsView()
   }
}
