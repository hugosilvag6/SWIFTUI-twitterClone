//
//  RegistrationView.swift
//  TwitterCloneSwiftUI
//
//  Created by Hugo Silva on 12/12/22.
//

import SwiftUI

struct RegistrationView: View {
   @State var email = ""
   @State var password = ""
   @State var fullname = ""
   @State var username = ""
   @State var showImagePicker = false
   @State var selectedUIImage: UIImage?
   @State var image: Image?
   @Environment(\.presentationMode) var mode
   @EnvironmentObject var viewModel: AuthViewModel
   
   func loadImage() {
      guard let selectedUIImage else { return }
      image = Image(uiImage: selectedUIImage)
   }
    var body: some View {
       ZStack {
          VStack {
             Button {
                showImagePicker.toggle()
             } label: {
                ZStack {
                   if let image {
                      image
                         .resizable()
                         .scaledToFill()
                         .frame(width: 140, height: 140)
                         .clipShape(Circle())
                         .padding(.top, 88)
                         .padding(.bottom, 32)
                   } else {
                      Image("plus_photo")
                         .resizable()
                         .renderingMode(.template)
                         .scaledToFill()
                         .frame(width: 140, height: 140)
                         .padding(.top, 88)
                         .padding(.bottom, 32)
                         .foregroundColor(.white)
                   }
                }
             }.sheet(isPresented: $showImagePicker) {
                loadImage()
             } content: {
                ImagePicker(image: $selectedUIImage)
             }


             
             VStack (spacing: 16) {
                CustomTextField(text: $email, placeholder: "Email", imageName: "envelope")
                   .padding()
                   .background(Color.init(white: 1, opacity: 0.15))
                   .cornerRadius(10)
                   .foregroundColor(.white)
                CustomTextField(text: $fullname, placeholder: "Full Name", imageName: "person")
                   .padding()
                   .background(Color.init(white: 1, opacity: 0.15))
                   .cornerRadius(10)
                   .foregroundColor(.white)
                CustomTextField(text: $username, placeholder: "Username", imageName: "person")
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
             
             Button {
                guard let selectedUIImage else { return }
                viewModel.registerUser(email: email, password: password, username: username, fullname: fullname, profileImage: selectedUIImage)
             } label: {
                Text("Sign Up")
                   .font(.headline)
                   .foregroundColor(.blue)
                   .frame(width: 360, height: 50)
                   .background(Color.white)
                   .cornerRadius(25)
                   .padding()
             }
             
             Spacer()
             
             Button {
                mode.wrappedValue.dismiss()
             } label: {
                HStack {
                   Text("Already have an account?")
                      .font(.system(size: 14))
                   Text("Sign In")
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

struct RegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationView()
    }
}
