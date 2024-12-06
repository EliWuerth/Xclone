//
//  XCloneApp.swift
//  XClone
//
//  Created by Eli Wuerth on 12/5/24.
//

import SwiftUI
import Firebase

@main
struct XCloneApp: App {
    
    @StateObject var viewModel = AuthViewModel()
    
    init(){
        FirebaseApp.configure()
    }
  var body: some Scene {
    WindowGroup {
      NavigationView {
          ContentView()
      }
      .environmentObject(viewModel)

    }
  }
}

