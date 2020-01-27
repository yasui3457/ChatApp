//
//  RootView.swift
//  ChatApp
//
//  Created by riku yasui on 2020/01/26.
//  Copyright © 2020 riku yasui. All rights reserved.
//

import SwiftUI

struct RootView: View {
    
    @EnvironmentObject private var session: Session
    
    var body: some View {
        switch  session.loginStatus {
            case false:
                return AnyView(LoginView(viewModel: LoginViewModel())
                    .environmentObject(session))
            case true:
                
                return AnyView(MainView(viewModel: MainViewModel(email: session.user.email)
                )
                    .environmentObject(session))
            default:
                Text("Other State.")
        }
    }
}

struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        RootView()
    }
}
