//
//  ContentView.swift
//  TwitterCloneSwiftUI
//
//  Created by Hugo Silva on 07/12/22.
//

import SwiftUI
import Kingfisher

struct ContentView: View {
   
   @EnvironmentObject var viewModel: AuthViewModel
   @State var selectedIndex = 0
   
   var body: some View {
      Group {
         if viewModel.userSession != nil {
            NavigationView {
               MainTabView(selectedIndex: $selectedIndex)
                  .navigationTitle(viewModel.tabTitle(forIndex: selectedIndex))
                  .navigationBarItems(leading: topLeftButton)
                  .navigationBarTitleDisplayMode(.inline)
            }
         } else {
            LoginView()
         }
      }
   }
}

extension ContentView {
   var topLeftButton: some View {
      Button(action: { viewModel.signOut() }, label: {
         if let user = viewModel.user {
            KFImage(URL(string: user.profileImageUrl))
               .resizable()
               .scaledToFill()
               .clipped()
               .frame(width: 32, height: 32)
               .cornerRadius(32/2)
         }
      })
   }
}

struct ContentView_Previews: PreviewProvider {
   static var previews: some View {
      ContentView()
   }
}
