//
//  AuthViewModel.swift
//  XClone
//
//  Created by Eli Wuerth on 12/6/24.
//

import SwiftUI
import FirebaseAuth

class AuthViewModel: ObservableObject {
    @Published var userSessions: FirebaseAuth.User?
    init() {
        self.userSessions = Auth.auth().currentUser
        
        print("Debug: user session is \(self.userSessions)")
    }
    
    func login(withEmail email: String, password: String){
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if let error = error {
                print("Debug: login failed with error \(error.localizedDescription)")
                return
            }
            self.userSessions = result?.user
            print("Debug: login successful")
        }
    }
    
    func registar(withEmail email: String, username: String, fullname: String, password: String){
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if let error = error{
                print("Debug: failed to registar with error \(error.localizedDescription)")
                return
            }
            
            guard let user = result?.user else{return}
            self.userSessions = user
            
            print("Debug: succes on registar")
        }
    }
    
    func logout() {
            do {
                try Auth.auth().signOut()
                self.userSessions = nil // Clear the user session
                print("Debug: logout successful")
            } catch let signOutError as NSError {
                print("Debug: Error signing out: %@", signOutError)
            }
        }
}

