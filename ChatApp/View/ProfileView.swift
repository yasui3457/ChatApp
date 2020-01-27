//
//  ProfileView.swift
//  ChatApp
//
//  Created by riku yasui on 2020/01/26.
//  Copyright © 2020 riku yasui. All rights reserved.
//

import SwiftUI

struct ProfileView: View {
    
    @ObservedObject var viewModel: ProfileViewModel
    @EnvironmentObject private var session: Session
    @Binding var showingProfile: Bool
    @State var myInfo: User
    
    var body: some View {
        NavigationView {
            HStack {
                List {
                    Text(myInfo.name + "さん")
                        .bold()
                        .font(.title)
                    
                    NavigationLink(destination: SearchUserView(viewModel: SearchUserViewModel())
                        .environmentObject(self.session)) {
                        Text("友達検索")
                            .foregroundColor(.white)
                    }
                    
                    Button(action: {
                        self.session.signOut()
                    }) {
                        Text("サインアウト")
                            .foregroundColor(.white)
                    }
                }
            }
            .navigationBarTitle(Text("User"), displayMode: .inline)
            .navigationBarItems(trailing: Button(action: {
                self.showingProfile = false
            }){
                Image(systemName: "xmark")
                    .foregroundColor(.white)
            })
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(viewModel: ProfileViewModel(), showingProfile: .constant(true), myInfo: User(email: "", name: "", userId: ""))
    }
}
