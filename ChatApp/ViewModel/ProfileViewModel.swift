//
//  ProfileViewModel.swift
//  ChatApp
//
//  Created by riku yasui on 2020/01/26.
//  Copyright © 2020 riku yasui. All rights reserved.
//

import SwiftUI
import Firebase

class ProfileViewModel: ObservableObject, Identifiable {
    @Published var user: String;
    
    init() {
        user = "User名"
    }
}
