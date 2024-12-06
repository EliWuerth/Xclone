//
//  UserRowView.swift
//  XClone
//
//  Created by Eli Wuerth on 12/5/24.
//

import SwiftUI

struct UserRowView: View {
    var body: some View {
        HStack{
            Circle()
                .frame(width:48, height:48)
            
            VStack(alignment: .leading, spacing: 4){
                Text("PowerMizzoucom")
                    .font(.subheadline).bold()
                    .foregroundColor(.black)
                
                Text("Power Mizzou")
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            Spacer()
        }
        .padding(.horizontal)
        .padding(.vertical,4)
    }
}

#Preview {
    UserRowView()
}
