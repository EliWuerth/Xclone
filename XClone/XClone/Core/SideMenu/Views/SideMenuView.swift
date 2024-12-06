//
//  SideMenuView.swift
//  XClone
//
//  Created by Eli Wuerth on 12/5/24.
//

import SwiftUI

struct SideMenuView: View {
    @EnvironmentObject var viewModels: AuthViewModel
    var body: some View {
        
        VStack(alignment: .leading, spacing: 32) {
            VStack(alignment: .leading){
                Circle()
                    .frame(width:48, height: 48)
                
                VStack(alignment: .leading, spacing: 4){
                    Text("Power Mizzou")
                        .font(.headline)
                    
                    Text("@PowerMizzoucom")
                        .font(.caption)
                        .foregroundColor(.gray)
                }
                
                UserStatView()
                    .padding(.vertical)
            }
            .padding(.leading)
            
            ForEach(SideMenuViewModel.allCases, id: \.rawValue){ viewModel in
                if viewModel == .profile {
                    NavigationLink {
                        ProfileView()
                    } label: {
                        SideMenuRowView(viewModel: viewModel)
                    }
                } else if viewModel == .logout{
                    Button{
                        print("Handle lougout here...")
                        viewModels.logout()
                    } label: {
                        SideMenuRowView(viewModel: viewModel)
                    }
                } else {
                    SideMenuRowView(viewModel: viewModel)
                }
                
            }
            Spacer()
        }
    }
}

#Preview {
    SideMenuView()
}
