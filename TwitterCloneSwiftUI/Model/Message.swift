//
//  Message.swift
//  TwitterCloneSwiftUI
//
//  Created by Hugo Silva on 08/12/22.
//

import Foundation

struct MockMessage: Identifiable {
   let id: Int
   let imageName: String
   let messageText: String
   let isCurrentUser: Bool
}

let MOCK_MESSAGES: [MockMessage] = [
   .init(id: 0, imageName: "spiderman", messageText: "Hey whats up?", isCurrentUser: false),
   .init(id: 1, imageName: "batman", messageText: "Not much, you?", isCurrentUser: true),
   .init(id: 2, imageName: "batman", messageText: "Hows the marvel universe?", isCurrentUser: true),
   .init(id: 3, imageName: "spiderman", messageText: "Its pretty good dude", isCurrentUser: false),
   .init(id: 4, imageName: "spiderman", messageText: "Hows your battle with the joker?", isCurrentUser: false),
   .init(id: 5, imageName: "batman", messageText: "Not going so hot", isCurrentUser: true),
]
