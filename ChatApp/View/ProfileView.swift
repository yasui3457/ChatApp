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
                VStack(alignment: .leading, spacing: 10) {
                    Text(myInfo.name)
                        .bold()
                        .font(.title)
                    Button(action: {
                        self.session.signOut()
                    }) {
                        Text("サインアウト")
                        .foregroundColor(.white)
                    }
                    Spacer()
                }
                Spacer()
            }

                
            .navigationBarTitle(Text("User"), displayMode: .inline)
                .navigationBarItems(trailing: Button("Close") {
                    self.showingProfile = false
                })
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(viewModel: ProfileViewModel(), showingProfile: .constant(true), myInfo: User(email: "", name: "", userId: ""))
    }
}
