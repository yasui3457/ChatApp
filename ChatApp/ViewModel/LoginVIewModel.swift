//
//  LoginVIewModel.swift
//  ChatApp
//
//  Created by riku yasui on 2020/01/26.
//  Copyright © 2020 riku yasui. All rights reserved.
//

import SwiftUI
import Combine
import Firebase

class LoginViewModel: ObservableObject, Identifiable {
    @Published var email: String;
    @Published var password: String;
    
    init() {
        self.email = "";
        self.password = "";
    }
}
