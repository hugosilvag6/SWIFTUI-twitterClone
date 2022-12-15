//
//  TwitterCloneSwiftUIApp.swift
//  TwitterCloneSwiftUI
//
//  Created by Hugo Silva on 07/12/22.
//

import SwiftUI
import Firebase

class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()

    return true
  }
}

@main
struct TwitterCloneSwiftUIApp: App {
   @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
   
    var body: some Scene {
        WindowGroup {
           ContentView().environmentObject(AuthViewModel.shared)
        }
    }
}
