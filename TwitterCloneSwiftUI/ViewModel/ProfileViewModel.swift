//
//  ProfileViewModel.swift
//  TwitterCloneSwiftUI
//
//  Created by Hugo Silva on 13/12/22.
//

import SwiftUI
import Firebase

class ProfileViewModel: ObservableObject {
   @Published var isFollowed = false
   let user: User
   
   init(user: User) {
      self.user = user
      checkIfUserIsFollowed()
   }
   
   func follow() {
      guard let currentUid = Auth.auth().currentUser?.uid else { return }
      let followingRef = COLLECTION_FOLLOWING.document(currentUid).collection("user-following")
      let followersRef = COLLECTION_FOLLOWERS.document(self.user.id).collection("user-followers")
      followingRef.document(user.id).setData([:]) { _ in
         followersRef.document(currentUid).setData([:]) { _ in
            self.isFollowed = true
         }
      }
   }
   func unfollow() {
      guard let currentUid = Auth.auth().currentUser?.uid else { return }
      let followingRef = COLLECTION_FOLLOWING.document(currentUid).collection("user-following")
      let followersRef = COLLECTION_FOLLOWERS.document(self.user.id).collection("user-followers")
      followingRef.document(user.id).delete { _ in
         followersRef.document(currentUid).delete { _ in
            self.isFollowed = false
         }
      }
   }
   func checkIfUserIsFollowed() {
      guard let currentUid = Auth.auth().currentUser?.uid else { return }
      let followingRef = COLLECTION_FOLLOWING.document(currentUid).collection("user-following")
      
      followingRef.document(user.id).getDocument { snapshot, error in
         guard let isFollowed = snapshot?.exists else { return }
         self.isFollowed = isFollowed
      }
   }
}
