//
//  User.swift
//  TwitterCloneSwiftUI
//
//  Created by Hugo Silva on 13/12/22.
//

import Foundation
import Firebase

struct User: Identifiable {
   let id: String
   let username: String
   let profileImageUrl: String
   let fullname: String
   let email: String
   
   var isCurrentUser: Bool {
      return Auth.auth().currentUser?.uid == self.id
   }
   
   init(dictionary: [String:Any]) {
      self.id = dictionary["uid"] as? String ?? ""
      self.username = dictionary["username"] as? String ?? ""
      self.profileImageUrl = dictionary["profileImageUrl"] as? String ?? ""
      self.fullname = dictionary["fullname"] as? String ?? ""
      self.email = dictionary["email"] as? String ?? ""
   }
}
