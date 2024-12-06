//
//  LoginView.swift
//  XClone
//
//  Created by Eli Wuerth on 12/5/24.
//

import SwiftUI

struct LoginView: View {
    @State private var email = ""
    @State private var password  = ""
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        VStack{
            VStack(alignment: .leading){
                HStack{ Spacer()}
                
                Text("Hello.")
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                
                Text("Welcome Back")
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
                
                TextField("Password", text: $password)
            }
            .padding(.horizontal,32)
            .padding(.top, 44)
            
            HStack(){
                Spacer()
                
                NavigationLink{
                    Text("Reset Password view..")
                } label: {
                    Text("Forgot Password?")
                        .font(.caption)
                        .fontWeight(.bold)
                        .foregroundColor(Color(.systemBlue))
                        .padding(.top)
                        .padding(.trailing, 24)
                }
            }
            
            Button{
                viewModel.login(withEmail: email, password: password)
            }label: {
                Text("Sign in")
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
                RegistrationView()
                    .navigationBarHidden(true)
            } label: {
                HStack{
                    Text("Don't have an account?")
                        .font(.footnote)
                    
                    Text("Sign Up")
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
    LoginView()
}
