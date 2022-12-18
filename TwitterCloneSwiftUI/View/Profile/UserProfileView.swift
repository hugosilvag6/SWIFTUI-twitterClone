//
//  UserProfileView.swift
//  TwitterCloneSwiftUI
//
//  Created by Hugo Silva on 12/12/22.
//

import SwiftUI

struct UserProfileView: View {
   @State var selectedFilter: TweetFilterOptions = .tweets
   @ObservedObject var viewModel: ProfileViewModel
   let user: User
   
   init(user: User) {
      self.user = user
      self.viewModel = ProfileViewModel(user: user)
   }
   
    var body: some View {
       ScrollView {
          VStack {
             ProfileHeaderView(viewModel: viewModel)
                .padding()
             FilterButtonView(selectedOption: $selectedFilter)
                .padding()
             ForEach(viewModel.tweets(forFilter: selectedFilter)){ tweet in
                TweetCell(tweet: tweet)
                   .padding(.horizontal, 45)
             }
          }
          
          .navigationTitle(user.username)
       }
    }
}

struct UserProfileView_Previews: PreviewProvider {
    static var previews: some View {
       UserProfileView(user: User(dictionary: [:]))
    }
}
