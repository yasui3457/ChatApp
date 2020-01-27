//
//  MainView.swift
//  ChatApp
//
//  Created by riku yasui on 2020/01/26.
//  Copyright © 2020 riku yasui. All rights reserved.
//

import SwiftUI

struct MainView: View {
    
    @ObservedObject var viewModel: MainViewModel
    @EnvironmentObject var session: Session
    
    @State var showingProfile = false
    
    var body: some View {
        NavigationView {
            VStack {
                Text("FriendList")
                
                List(viewModel.friends) { friend in
                    HStack {
                        Text(friend.userId)
                        Spacer()
                        if friend.status {
                            Text("友達")
                        } else {
                            Text("申請中")
                        }
                    }
                }
            }
                    
            .navigationBarTitle(Text("ChatApp"))
            .navigationBarItems(trailing: profileButton)
        }.sheet(isPresented: $showingProfile) {
            ProfileView(viewModel: ProfileViewModel(), showingProfile: self.$showingProfile, myInfo: self.viewModel.myInfo)
                .environmentObject(self.session)
        }
    }
    
    var profileButton: some View {
        Button(action: {
            self.showingProfile.toggle()
        }) {
            Image(systemName: "person.crop.circle")
                .imageScale(.large)
                .accessibility(label: Text("User Profile"))
                .padding()
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView(viewModel: MainViewModel(email: ""))
    }
}
