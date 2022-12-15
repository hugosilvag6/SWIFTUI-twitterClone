//
//  ProfileActionButtonView.swift
//  TwitterCloneSwiftUI
//
//  Created by Hugo Silva on 12/12/22.
//

import SwiftUI

struct ProfileActionButtonView: View {
   let viewModel: ProfileViewModel
   @Binding var isFollowed: Bool
   
    var body: some View {
       if viewModel.user.isCurrentUser {
          Button {
             //
          } label: {
             Text("Edit profile")
                .frame(width: 360, height: 40)
                .background(Color.blue)
                .foregroundColor(.white)
          }
          .cornerRadius(20)
       } else {
          HStack {
             Button {
                isFollowed ? viewModel.unfollow() : viewModel.follow()
             } label: {
                Text(isFollowed ? "Following" : "Follow")
                   .frame(width: 180, height: 40)
                   .background(Color.blue)
                   .foregroundColor(.white)
             }
             .cornerRadius(20)
             Button {
                //
             } label: {
                Text("Message")
                   .frame(width: 180, height: 40)
                   .background(Color.purple)
                   .foregroundColor(.white)
             }
             .cornerRadius(20)
          }
       }
    }
}
