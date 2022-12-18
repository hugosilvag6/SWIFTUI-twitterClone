//
//  SearchViewModel.swift
//  TwitterCloneSwiftUI
//
//  Created by Hugo Silva on 13/12/22.
//

import SwiftUI
import Firebase

enum SearchViewModelConfiguration {
   case search, newMessage
}

class SearchViewModel: ObservableObject {
   @Published var users = [User]()
   private let config: SearchViewModelConfiguration
   
   init(config: SearchViewModelConfiguration) {
      self.config = config
      fetchUsers(forConfig: config)
   }
   
   func fetchUsers(forConfig config: SearchViewModelConfiguration) {
      COLLECTION_USERS.getDocuments { snapshot, error in
         guard let documents = snapshot?.documents else { return }
         let users = documents.map ({ User(dictionary: $0.data()) })
         
         switch config {
         case .search:
            self.users = users
         case .newMessage:
            self.users = users.filter({ !$0.isCurrentUser })
         }
         
         
      }
   }
   func filteredUsers(_ query: String) -> [User] {
      let lowercasedQuery = query.lowercased()
      return users.filter({ $0.fullname.lowercased().contains(lowercasedQuery) || $0.username.contains(lowercasedQuery)})
   }
}
