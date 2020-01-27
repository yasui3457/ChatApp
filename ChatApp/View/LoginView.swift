//
//  LoginView.swift
//  ChatApp
//
//  Created by riku yasui on 2020/01/26.
//  Copyright © 2020 riku yasui. All rights reserved.
//

import SwiftUI

struct LoginView: View {
    
    @ObservedObject var viewModel: LoginViewModel
    @EnvironmentObject var session: Session
    
    var body: some View {
        VStack {
            Image("LoginImage")
                .resizable()
                .aspectRatio(contentMode: ContentMode.fit)
                .frame(width: CGFloat(100.0), height: CGFloat(100.0))
            
            Text("Login")
                .bold()
                .font(.title)
            
            TextField("Email", text: $viewModel.email)
                .padding()
                .background(Color.gray)
                .cornerRadius(4.0)
                .padding(EdgeInsets(top: 0, leading: 10, bottom: 15, trailing: 10))
            
            SecureField("Password", text: $viewModel.password)
                .padding()
                .background(Color.gray)
                .cornerRadius(4.0)
                .padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10))
            
            Button(action:{
                self.session.signIn(email: self.viewModel.email, password: self.viewModel.password)
            }) {
                HStack(alignment: .center) {
                    Spacer()
                    Text("Login")
                        .foregroundColor(Color.white)
                        .bold()
                    Spacer()
                }.padding().background(Color.green).cornerRadius(4.0)
            }.padding(EdgeInsets(top: 0, leading: 10, bottom: 15, trailing: 10))
            
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView(viewModel: LoginViewModel())
    }
}
