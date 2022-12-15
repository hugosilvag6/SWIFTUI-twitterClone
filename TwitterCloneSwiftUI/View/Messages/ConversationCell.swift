//
//  ConversationCell.swift
//  TwitterCloneSwiftUI
//
//  Created by Hugo Silva on 08/12/22.
//

import SwiftUI

struct ConversationCell: View {
    var body: some View {
       VStack {
          HStack (spacing: 12) {
             Image("venom-10")
                .resizable()
                .scaledToFill()
                .clipped()
                .frame(width: 56, height: 56)
                .cornerRadius(56/2)
             
             VStack (alignment: .leading, spacing: 4) {
                Text("Venom")
                   .font(.system(size: 14, weight: .semibold))
                
                Text("Longer message text to see what happens when i do this")
                   .multilineTextAlignment(.leading)
                   .font(.system(size: 15))
                   .lineLimit(2)
             }
             .foregroundColor(.black)
             .padding(.trailing)
          }
          Divider()
       }
    }
}

struct ConversationCell_Previews: PreviewProvider {
    static var previews: some View {
        ConversationCell()
    }
}
