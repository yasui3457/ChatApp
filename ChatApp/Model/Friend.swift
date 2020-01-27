//
//  Friend.swift
//  ChatApp
//
//  Created by riku yasui on 2020/01/26.
//  Copyright © 2020 riku yasui. All rights reserved.
//

import Combine
import Foundation

struct Friend: Identifiable  {
    var id  = UUID()
    var status: Bool = false
    var userId: String = ""
}

