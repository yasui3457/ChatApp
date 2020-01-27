//
//  SearchUserView.swift
//  ChatApp
//
//  Created by riku yasui on 2020/01/27.
//  Copyright © 2020 riku yasui. All rights reserved.
//

import SwiftUI

struct SearchUserView: View {
    
    @ObservedObject var viewModel: SearchUserViewModel
    @EnvironmentObject private var session: Session
    
    @ViewBuilder
    var body: some View {
        VStack {
            Text("IDで検索")
                .bold()
                .font(.title)
            HStack {
                TextField("Search", text: $viewModel.searchText)
                    .background(Color.gray)
                    .cornerRadius(4.0)
                    .padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 0))
                Button(action: {
                    self.viewModel.searchUser()
                }) {
                    Image(systemName: "magnifyingglass")
                            .padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10))
                    }.padding(EdgeInsets(top: 10, leading: 0, bottom: 0, trailing: 0))
            }
            if viewModel.searchFlg == true {
                HStack {
                    Text(viewModel.descriptionText)
                        .foregroundColor(Color.white)
                        .multilineTextAlignment(.leading)
                    Button(action: {
                        self.viewModel.addFriend(email: self.session.user.email)
                    }) {
                        Text("はい")
                    }
                    Button(action: {
                        self.viewModel.initStatus()
                    }) {
                        Text("いいえ")
                    }
                }
            } else {
                Text(viewModel.descriptionText)
                    .foregroundColor(Color.red)
                    .multilineTextAlignment(.leading)
            }
            Spacer()
        }
    }
}

struct SearchUserView_Previews: PreviewProvider {
    static var previews: some View {
        SearchUserView(viewModel: SearchUserViewModel())
    }
}
