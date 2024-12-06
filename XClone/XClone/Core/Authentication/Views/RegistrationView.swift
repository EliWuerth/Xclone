//
//  RegistrationView.swift
//  XClone
//
//  Created by Eli Wuerth on 12/5/24.
//

import SwiftUI

struct RegistrationView: View {
    @State private var email = ""
    @State private var username  = ""
    @State private var fullname = ""
    @State private var password  = ""
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        VStack{
            VStack(alignment: .leading){
                HStack{ Spacer()}
                
                Text("Get Started.")
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                
                Text("Ceate your account")
                    .font(.largeTitle)
                    .fontWeight(.semibold)
            }
            .frame(height: 260)
            .padding(.leading)
            .background(Color(.systemBlue))
            .foregroundColor(.white)
            .clipShape(RoundedShape(corners: [.bottomRight]))
            
            VStack(spacing:40){
                TextField("Email", text: $email)
                
                TextField("Username", text: $username)
                
                TextField("full name", text: $fullname)
                
                TextField("Password", text: $password)
            }
            .padding(.horizontal,32)
            .padding(.top, 44)
            
            Spacer()
            
            Button{
                viewModel.registar(withEmail: email, username: username, fullname: fullname, password: password)
            }label: {
                Text("Sign Up")
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(width: 340, height: 50)
                    .background(Color(.systemBlue))
                    .clipShape(Capsule())
            }
            .shadow(color: .gray.opacity(0.5), radius: 10, x: 0, y:0)
            .padding(32)
            
            Spacer()
            
            NavigationLink{
                LoginView()
                    .navigationBarHidden(true)
            } label: {
                HStack{
                    Text("Already have an account?")
                        .font(.footnote)
                    
                    Text("Sign In")
                        .font(.footnote)
                        .fontWeight(.semibold)
                    
                }
            }
            .padding(.bottom)
            .foregroundColor(Color(.systemBlue))
            
            Spacer()
        }
        .ignoresSafeArea()
        .navigationBarHidden(true)
    }
}

#Preview {
    RegistrationView()
}
