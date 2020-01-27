//
//  Session.swift
//  ChatApp
//
//  Created by riku yasui on 2020/01/26.
//  Copyright © 2020 riku yasui. All rights reserved.
//

import SwiftUI
import Combine
import Firebase

final class Session: ObservableObject {
    
    @Published var loginStatus: Bool;
    @Published var user: User;
    
    init() {
        self.loginStatus = false
        self.user = User(email: "", name: "", userId: "")
    }
    
    func signIn(email: String, password: String) {
        Auth.auth().signIn(withEmail: email, password: password) { (user, error) in
            if error != nil {
                self.loginStatus = false
            } else {
                self.user = User(email: email, name: "", userId: "")
                self.loginStatus = true
            }
        
        }
    }
    
    func signOut() {
        do {
            try Auth.auth().signOut()
            self.loginStatus = false
        } catch {
            self.loginStatus = false
        }
    }

}
