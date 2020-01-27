//
//  SearchUserViewModel.swift
//  ChatApp
//
//  Created by riku yasui on 2020/01/27.
//  Copyright © 2020 riku yasui. All rights reserved.
//

import SwiftUI
import Combine
import Firebase

class SearchUserViewModel: ObservableObject, Identifiable {
    
    @Published var searchText: String;
    @Published var descriptionText: String;
    @Published var searchFlg: Bool;
    @Published var friend: User;
    
    var userInfoManager: UserInfoManager
    
    init() {
        self.searchText = "";
        self.descriptionText = "ユーザを検索してください。"
        self.searchFlg = false
        self.friend = User()
        userInfoManager = UserInfoManager()
    }
    
    func initStatus() {
        self.searchText = "";
        self.descriptionText = "ユーザを検索してください。"
        self.searchFlg = false
        self.friend = User()
    }
    
    func searchUser() {
        userInfoManager.searchUser(userId: searchText)
            .receive(on: RunLoop.main)
            .sink(receiveCompletion: { completion in
                print("receiveCompletion:", completion)
                switch completion {
                case .finished:
                    self.searchFlg = true
                case .failure(_):
                    self.descriptionText = "ユーザの検索に失敗しました。"
                    self.searchFlg = false
                }
            }, receiveValue: {user in
                self.friend = user
                self.descriptionText = user.name + "さんを追加しますか?"
            })
    }
    
    func addFriend(email: String) {
        userInfoManager.addFriend(email: email, friend: friend)
    }
}
