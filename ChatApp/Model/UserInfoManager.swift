//
//  UserInfoManager.swift
//  ChatApp
//
//  Created by riku yasui on 2020/01/26.
//  Copyright © 2020 riku yasui. All rights reserved.
//

import Foundation
import Combine
import Firebase

final class UserInfoManager {
    
    var db: Firestore!
    
    init() {
        self.db = Firestore.firestore()
        print()
    }
    
    func getMyInfo(email: String) -> Future<User, Error> {
        return Future<User, Error> {promise in
            var myInfo: User = User()
            var user = self.db.collection("users")
            user.whereField("email", isEqualTo: email)
                .getDocuments(){(querySnapshot, err) in
                    print("getMyInfo in.")
                    for val in querySnapshot!.documents {
                        print(val)
                        myInfo.email = email
                        myInfo.name = val.get("name") as! String
                        myInfo.userId = val.get("userId") as! String
                        promise(.success(myInfo))
                }
            }
        }
    }
    
    func getMyFriends(email: String) -> Future<[Friend], Error> {
        return Future<[Friend], Error> {promise in
            var friendList: [Friend] = []
            var friends = self.db.collection("users").document(email).collection("friends")
                .getDocuments(){(querySnapshot, err) in
                    print("getMyInfo in.")
                    for val in querySnapshot!.documents {
                        print(val)
                        friendList.append(
                            Friend(
                                status: val.get("status") as! Bool,
                                userId: val.get("userId") as! String)
                        )
                    }
                    promise(.success(friendList))
                }
        }
    }
    

}
