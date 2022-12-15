//
//  UserCell.swift
//  TwitterCloneSwiftUI
//
//  Created by Hugo Silva on 08/12/22.
//

import SwiftUI
import Kingfisher

struct UserCell: View {
   let user: User
   
    var body: some View {
       HStack (spacing: 12) {
          KFImage(URL(string: user.profileImageUrl))
             .resizable()
             .scaledToFill()
             .clipped()
             .frame(width: 56, height: 56)
             .cornerRadius(56/2)
          
          VStack (alignment: .leading, spacing: 4) {
             Text(user.username)
                .font(.system(size: 14, weight: .semibold))
             
             Text(user.fullname)
                .font(.system(size: 14))
          }
          .foregroundColor(.black)
       }
    }
}

struct UserCell_Previews: PreviewProvider {
    static var previews: some View {
       UserCell(user: User(dictionary: [:]))
    }
}
