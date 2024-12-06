//
//  ProfileView.swift
//  XClone
//
//  Created by Eli Wuerth on 12/5/24.
//

import SwiftUI

// Function to determine the text color based on the current color scheme
    private func dynamicTextColor2() -> Color {
        return Color(UIColor { traitCollection in
            return traitCollection.userInterfaceStyle == .dark ? UIColor.black : UIColor.white
        })
    }

// Function to determine the text color based on the current color scheme
    private func dynamicTextColor() -> Color {
        return Color(UIColor { traitCollection in
            return traitCollection.userInterfaceStyle == .dark ? UIColor.white : UIColor.black
        })
    }

/*struct toolBarLine: View {
    var body: some View {
        HStack{
            // Back arrow
            Button{
                
            } label: {
                Circle()
                    .foregroundColor(.black)
                    .opacity(0.5)
                    .frame(width: 30, height: 30)
                    .offset(x: 12, y: 14)
                    .padding(2)
                    .overlay(
                        Image(systemName: "arrow.left")
                            .resizable()
                            .frame(width: 13, height: 13)
                            .offset(x: 12, y: 14)
                            .foregroundColor(.white)
                            .padding(2)
                    )
            }
            
            Spacer()
            
            // search for a tweet button
            Button{
                
            } label: {
                Circle()
                    .foregroundColor(.black)
                    .opacity(0.5)
                    .frame(width: 30, height: 30)
                    .offset(x: -14, y: 14)
                    .padding(2)
                    .overlay(
                        Image(systemName: "magnifyingglass")
                            .resizable()
                            .frame(width: 15, height: 15)
                            .offset(x: -14, y: 14)
                            .foregroundColor(.white)
                            .padding(2)
                    )
            }
            
            // ellipsis button
            Button{
                
            } label: {
                Circle()
                    .foregroundColor(.black)
                    .opacity(0.5)
                    .frame(width: 30, height: 30)
                    .offset(x: -17, y: 14)
                    .padding(2)
                    .overlay(
                        Image(systemName: "ellipsis")
                            .frame(width: 15)
                            .offset(x: -17, y: 14)
                            .foregroundColor(.white)
    
                    )
            }
        }
    }
}

*/
struct ProfileView: View {
    @State private var selectedFilter: TweetFilterViewsModel = .tweets
    @Environment(\.presentationMode) var mode
    @Namespace var animation
    var body: some View {
        VStack{
            headerView
            
            ActionButtonView
            
            UserInfoDetails
            
            filterBar
            
            tweetsView
            
            Spacer()
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    ProfileView()
}

extension ProfileView {
    var headerView: some View {
        ZStack(alignment: .bottomLeading){
            Image("header")
                .resizable()
                .frame(height: 148)
                .edgesIgnoringSafeArea(.top)
            
            VStack{
                HStack{
                    // Back arrow
                    Button{
                        mode.wrappedValue.dismiss()
                    } label: {
                        Circle()
                            .foregroundColor(.black)
                            .opacity(0.5)
                            .frame(width: 30, height: 30)
                            .offset(x: 12, y: 14)
                            .padding(2)
                            .overlay(
                                Image(systemName: "arrow.left")
                                    .resizable()
                                    .frame(width: 13, height: 13)
                                    .offset(x: 12, y: 14)
                                    .foregroundColor(.white)
                                    .padding(2)
                            )
                    }
                    
                    Spacer()
                    
                    // search for a tweet button
                    Button{
                        
                    } label: {
                        Circle()
                            .foregroundColor(.black)
                            .opacity(0.5)
                            .frame(width: 30, height: 30)
                            .offset(x: -14, y: 14)
                            .padding(2)
                            .overlay(
                                Image(systemName: "magnifyingglass")
                                    .resizable()
                                    .frame(width: 15, height: 15)
                                    .offset(x: -14, y: 14)
                                    .foregroundColor(.white)
                                    .padding(2)
                                )
                    }
                    
                    // ellipsis button
                    Button{
                        
                    } label: {
                        Circle()
                            .foregroundColor(.black)
                            .opacity(0.5)
                            .frame(width: 30, height: 30)
                            .offset(x: -17, y: 14)
                            .padding(2)
                            .overlay(
                                Image(systemName: "ellipsis")
                                    .frame(width: 15)
                                    .offset(x: -17, y: 14)
                                    .foregroundColor(.white)
            
                            )
                    }
                }
                Circle()
                    .frame(width: 80, height: 80)
                    .offset(x: -150, y: 18)
                    .foregroundColor(dynamicTextColor2())
                    .overlay(
                        Image("profile_image")
                            .resizable()
                            .frame(width: 72, height: 72)
                            .clipShape(Circle())
                            .offset(x: -150, y: 18)
                    )
            }
        }
        .frame(height: 96)
        
    }
    
    var ActionButtonView: some View {
        HStack(spacing: 12){
            Spacer()
            
            Image(systemName: "bell.badge")
                .font(.title3)
                .padding(6)
                .overlay(Circle().stroke(Color.gray, lineWidth: 0.75))
                .offset(x: 10, y: 0)
            
            Image(systemName: "envelope")
                .font(.title3)
                .padding(6)
                .overlay(Circle().stroke(Color.gray, lineWidth: 0.75))
                .offset(x: 5, y: 0)
            
            
            Button{
                
            } label: {
                Text("Following")
                    .font(.subheadline).bold()
                    .frame(width: 120, height: 32)
                    .foregroundColor(dynamicTextColor())
                    .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color.gray, lineWidth: 0.75))
            }
        }
        .padding(.trailing)
    }
    
    var UserInfoDetails: some View {
        VStack(alignment: .leading, spacing: 4) {
            HStack{
                Text("Power Mizzou")
                    .font(.title2).bold()
                
                Image(systemName: "checkmark.seal.fill")
                    .foregroundColor(Color(.systemBlue))
            }
            
            Text("@PowerMizzoucom")
                .font(.subheadline)
                .foregroundColor(.gray)
            
            Text("Official Twitter account of ")
                .font(.subheadline) +
            Text("PowerMizzou.com")
                .font(.subheadline)
                .foregroundColor(.blue) +
            Text(", your best Mizzou coverage now part of ")
                .font(.subheadline) +
            Text("@247sports")
                .font(.subheadline)
                .foregroundColor(.blue) +
            Text(". Follow: ")
                .font(.subheadline) +
            Text("@SeanW_247Sports")
                .font(.subheadline)
                .foregroundColor(.blue) +
            Text(" & ")
                .font(.subheadline) +
            Text("@jarodchamilton")
                .font(.subheadline)
                .foregroundColor(.blue) +
            Text(" & ")
                .font(.subheadline) +
            Text("@drewking0222")
                .font(.subheadline)
                .foregroundColor(.blue)
            
            VStack(alignment: .leading, spacing: 18){
                HStack(spacing: 4){
                    Image(systemName: "link")
                    
                    Text("247sports.com/college/missou...")
                        .foregroundColor(.blue)
                }
                
                HStack(spacing: 4){
                    Image(systemName: "calendar")
                    
                    Text("Joined September 2011")
                }
            }
            .font(.caption)
            .foregroundColor(.gray)
            
            
            UserStatView()
                
            
            HStack {
                Image("follower3")
                    .resizable()
                    .frame(width: 40, height: 40)
                    .clipShape(Circle())
                    .offset(x: 40)
                    .overlay(
                    Image("follower2")
                        .resizable()
                        .frame(width: 40, height: 40)
                        .clipShape(Circle())
                        .offset(x: 15)
                        .overlay(
                            Image("follower1")
                            .resizable()
                            .frame(width: 40, height: 40)
                            .clipShape(Circle())
                            .offset(x: -10)
                        )
                    )
            
                Text("Followed by Mizzou Football, Tucker D. Franklin, Jeremiah Mcclellan, and 15 others")
                    .font(.caption)
                    .foregroundColor(.gray)
                    .offset(x: 40)
            }
        }
        .padding(.horizontal)
    }
    
   
    var filterBar: some View {
        HStack {
            ForEach(TweetFilterViewsModel.allCases, id: \.rawValue) { item in
                VStack{
                    Text(item.title)
                        .font(.subheadline)
                        .fontWeight(selectedFilter == item ? .semibold : .regular)
                        .foregroundColor(selectedFilter == item ? dynamicTextColor() : .gray)
                    
                    if selectedFilter == item {
                        Capsule()
                            .foregroundColor(Color(.systemBlue))
                            .frame(height:3)
                    }else{
                        Capsule()
                            .foregroundColor(Color(.clear))
                            .frame(height:3)
                    }
                }
                .onTapGesture {
                    withAnimation(.easeInOut){
                        self.selectedFilter = item
                    }
                }
            }
        }
        .overlay(Divider().offset(x: 0, y: 16))
    }
    
    var tweetsView: some View {
        ScrollView{
            LazyVStack{
                ForEach(0 ... 9, id: \.self) { _ in
                    TweetRowView()
                        .padding()
                }
            }
        }
    }
}
