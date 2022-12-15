//
//  SearchViewModel.swift
//  TwitterCloneSwiftUI
//
//  Created by Hugo Silva on 13/12/22.
//

import SwiftUI
import Firebase

class SearchViewModel: ObservableObject {
   @Published var users = [User]()
   
   init() {
      fetchUsers()
   }
   
   func fetchUsers() {
      COLLECTION_USERS.getDocuments { snapshot, error in
         guard let documents = snapshot?.documents else { return }
         self.users = documents.map ({ User(dictionary: $0.data()) })
      }
   }
}
