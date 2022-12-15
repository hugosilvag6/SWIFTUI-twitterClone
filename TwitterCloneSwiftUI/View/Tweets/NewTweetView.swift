//
//  NewTweetView.swift
//  TwitterCloneSwiftUI
//
//  Created by Hugo Silva on 12/12/22.
//

import SwiftUI
import Kingfisher

struct NewTweetView: View {
   
   @Binding var isPresented: Bool
   @State var captionText: String = ""
   @ObservedObject var viewModel = UploadTweetViewModel()
   
   var body: some View {
      NavigationView {
         VStack {
            HStack (alignment: .top) {
               if let user = AuthViewModel.shared.user {
                  KFImage(URL(string: user.profileImageUrl))
                     .resizable()
                     .scaledToFill()
                     .clipped()
                     .frame(width: 64, height: 64)
                     .cornerRadius(32)
               }
               TextArea(text: $captionText, placeholder: "Whats happening?")
               Spacer()
            }
            .padding()
            .navigationBarItems(leading:
                                 Button {
               isPresented.toggle()
            } label: {
               Text("Cancel")
                  .foregroundColor(.blue)
            },
                                trailing:
                                 Button {
               viewModel.uploadTweet()
            } label: {
               Text("Tweet")
                  .padding(.horizontal)
                  .padding(.vertical, 8)
                  .background(Color.blue)
                  .foregroundColor(.white)
                  .clipShape(Capsule())
         })
            Spacer()
         }
      }
   }
}

struct NewTweetView_Previews: PreviewProvider {
   static var previews: some View {
      NewTweetView(isPresented: .constant(false))
   }
}
