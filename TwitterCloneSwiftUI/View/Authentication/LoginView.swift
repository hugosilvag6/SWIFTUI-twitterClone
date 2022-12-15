//
//  LoginView.swift
//  TwitterCloneSwiftUI
//
//  Created by Hugo Silva on 12/12/22.
//

import SwiftUI

struct LoginView: View {
   @State var email = ""
   @State var password = ""
   @EnvironmentObject var viewModel: AuthViewModel
   var body: some View {
      NavigationView {
         ZStack {
            VStack {
               Image("twitter-logo")
                  .resizable()
                  .scaledToFill()
                  .frame(width: 220, height: 100)
                  .padding(.top, 88)
                  .padding(.bottom, 32)
               
               VStack (spacing: 16) {
                  CustomTextField(text: $email, placeholder: "Email", imageName: "envelope")
                     .padding()
                     .background(Color.init(white: 1, opacity: 0.15))
                     .cornerRadius(10)
                     .foregroundColor(.white)
                  
                  CustomSecureField(text: $password, placeholder: "Password")
                     .padding()
                     .background(Color.init(white: 1, opacity: 0.15))
                     .cornerRadius(10)
                     .foregroundColor(.white)
               }.padding(.horizontal, 32)
               
               HStack {
                  Spacer()
                  Button {
                     //
                  } label: {
                     Text("Forgot password?")
                        .font(.footnote.bold())
                        .foregroundColor(.white)
                        .padding(.top, 16)
                        .padding(.trailing, 32)
                  }
               }
               
               Button {
                  viewModel.login(withEmail: email, password: password)
               } label: {
                  Text("Sign In")
                     .font(.headline)
                     .foregroundColor(.blue)
                     .frame(width: 360, height: 50)
                     .background(Color.white)
                     .cornerRadius(25)
                     .padding()
               }
               
               Spacer()
               
               NavigationLink {
                  RegistrationView()
                     .navigationBarBackButtonHidden()
               } label: {
                  HStack {
                     Text("Don't have an account?")
                        .font(.system(size: 14))
                     Text("Sign Up")
                        .font(.system(size: 14, weight: .semibold))
                  }
                  .foregroundColor(.white)
                  .padding(.bottom, 40)
               }

            }
         }.background(Color("TwitterBlue"))
            .ignoresSafeArea()
      }
   }
}

struct LoginView_Previews: PreviewProvider {
   static var previews: some View {
      LoginView()
   }
}
