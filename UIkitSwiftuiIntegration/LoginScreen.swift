//
//  LoginScreen.swift
//  UIkitSwiftuiIntegration
//
//  Created by Urvashi Gupta on 21/11/23.
//

import SwiftUI

struct LoginScreen: View {
    @ObservedObject var loginModel : LoginModel
    @State var isPresented = false
    @State var loginEmail = ""
    var body: some View {

            VStack{
                NavigationLink {
                    ViewControllerWrapper(loginModel: loginModel)
                } label: {
                    Text("Login")
                }

                TextField("Enter your email", text: $loginModel.email)
                    .font(.subheadline)
                    .padding(12)
                    .background(Color(.systemGray6))
                    .cornerRadius(10)
                    .padding(.horizontal, 24)
                SecureField("Enter your password", text: $loginModel.password)
                    .font(.subheadline)
                    .padding(12)
                    .background(Color(.systemGray6))
                    .cornerRadius(10)
                    .padding(.horizontal, 24)
                Text("Current Email: \(loginModel.email)")
            }
            Button(action: {
                isPresented.toggle()
            }, label: {
                Text("Login")
            })


        .fullScreenCover(isPresented: $isPresented, content: {
            ViewControllerWrapper(loginModel: loginModel)
        })
     

    }
}

//#Preview {
//    LoginScreen()
//}
