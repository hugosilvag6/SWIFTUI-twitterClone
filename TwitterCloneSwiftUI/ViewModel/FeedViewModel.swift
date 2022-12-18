//
//  FeedViewModel.swift
//  TwitterCloneSwiftUI
//
//  Created by Hugo Silva on 14/12/22.
//

import SwiftUI

class FeedViewModel: ObservableObject {
   @Published var tweets = [Tweet]()
   
   init() {
      fetchTweets()
   }
   
   func fetchTweets() {
      COLLECTION_TWEETS.getDocuments { snapshot, _ in
         guard let documents = snapshot?.documents else { return }
         self.tweets = documents.map({ Tweet(dictionary: $0.data() )})
      }
   }
}
