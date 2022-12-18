//
//  TweetCell.swift
//  TwitterCloneSwiftUI
//
//  Created by Hugo Silva on 07/12/22.
//

import SwiftUI
import Kingfisher

struct TweetCell: View {
   let tweet: Tweet
   
    var body: some View {
       VStack (alignment: .leading, spacing: 12) {
          HStack (alignment: .top) {
             KFImage(URL(string: tweet.profileImageUrl))
                .resizable()
                .scaledToFill()
                .clipped()
                .frame(width: 56, height: 56)
                .cornerRadius(56/2)
                .padding(.leading)
             
             VStack (alignment: .leading, spacing: 4) {
                HStack {
                   Text(tweet.fullname)
                      .font(.system(size: 14, weight: .semibold))
                      .foregroundColor(.black)
                   Text("@\(tweet.username) •")
                      .foregroundColor(.gray)
                   Text(tweet.timestampString)
                      .foregroundColor(.gray)
                }
                
                Text(tweet.caption)
                   .foregroundColor(.black)
             }
          }
          .padding(.bottom)
          .padding(.trailing)
          
          TweetActionsView(tweet: tweet)
          
          Divider()
       }
       .padding(.leading, -16)
    }
}

struct TweetCell_Previews: PreviewProvider {
    static var previews: some View {
       TweetCell(tweet: Tweet(dictionary: [:]))
    }
}
