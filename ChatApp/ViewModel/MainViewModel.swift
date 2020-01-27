//
//  MainViewModel.swift
//  ChatApp
//
//  Created by riku yasui on 2020/01/26.
//  Copyright © 2020 riku yasui. All rights reserved.
//

import SwiftUI
import Combine
import Firebase

class MainViewModel: ObservableObject, Identifiable {

    var myInfo: User
    @Published var friends: [Friend]
    var userInfoManager: UserInfoManager
    
    init(email: String) {
        friends = []
        userInfoManager = UserInfoManager()
        self.myInfo = User(email: "", name: "", userId: "")
        self.friends = []
        
        //自身のUser情報の取得
        getMyInfo(email: email)
        //Friends情報の取得
        getMyFriends(email: email)
    }
    
    func getMyInfo(email: String) {
        userInfoManager.getMyInfo(email: email)
            .receive(on: RunLoop.main)
            .sink(receiveCompletion: { completion in
                print("receiveCompletion:", completion)
            }, receiveValue: {user in
                self.myInfo = user
            })
    }
    
    func getMyFriends(email: String) {
        userInfoManager.getMyFriends(email: email)
            .receive(on: RunLoop.main)
            .sink(receiveCompletion: { completion in
                print("receiveCompletion:", completion)
            }, receiveValue: {users in
                self.friends = users
            })
    }
    
}
