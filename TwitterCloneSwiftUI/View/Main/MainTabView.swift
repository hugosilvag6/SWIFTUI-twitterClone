//
//  MainTabView.swift
//  TwitterCloneSwiftUI
//
//  Created by Hugo Silva on 18/12/22.
//

import SwiftUI

struct MainTabView: View {
   @Binding var selectedIndex: Int
   
    var body: some View {
       TabView(selection: $selectedIndex) {
          FeedView()
             .onTapGesture {
                selectedIndex = 0
             }
             .tabItem {
                Image(systemName: "house")
                Text("Home")
             }.tag(0)
          SearchView()
             .onTapGesture {
                selectedIndex = 1
             }
             .tabItem {
                Image(systemName: "magnifyingglass")
                Text("Search")
             }.tag(1)
          ConversationsView()
             .onTapGesture {
                selectedIndex = 2
             }
             .tabItem {
                Image(systemName: "envelope")
                Text("Message")
             }.tag(2)
       }
    }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
       MainTabView(selectedIndex: .constant(1))
    }
}
