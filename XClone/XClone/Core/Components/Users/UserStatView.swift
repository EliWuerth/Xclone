//
//  UserStatView.swift
//  XClone
//
//  Created by Eli Wuerth on 12/5/24.
//

import SwiftUI

struct UserStatView: View {
    var body: some View {
        HStack(spacing: 24){
            HStack(spacing: 4){
                Text("2.8K")
                    .font(.subheadline)
                    .bold()
                
                Text("Following")
                    .font(.caption)
                    .foregroundColor(.gray)
            }
            
            HStack(spacing: 4){
                Text("40.8K")
                    .font(.subheadline)
                    .bold()
                
                Text("Followers")
                    .font(.caption)
                    .foregroundColor(.gray)
            }
        }
        .padding(.vertical)
    }
}

#Preview {
    UserStatView()
}
