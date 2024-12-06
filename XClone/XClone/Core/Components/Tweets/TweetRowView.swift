//
//  TweetRowView.swift
//  XClone
//
//  Created by Eli Wuerth on 12/5/24.
//

import SwiftUI

struct TweetRowView: View {
    @State private var currentSymbol = "message"
    @State private var currentSymbol3 = "heart"
    @State private var currentSymbol4 = "bookmark"
    @State private var isRotated = false
    var body: some View {
        VStack(alignment: .leading){
            // profile image + user info + tweet
            HStack(alignment: .top, spacing: 12){
                Circle()
                    .frame(width: 56, height: 56)
                    .foregroundColor(Color(.systemBlue))
                    .overlay(
                        Image("profile_image")
                            .resizable()
                            .frame(width: 56, height: 56)
                            .clipShape(Circle())
                    )
                // user info + tweet caption
                VStack{
                    // user info
                    HStack {
                        Text("Power Mizzou")
                            .font(.subheadline).bold()
                        Text("@PowerMizzoucom")
                            .foregroundColor(.gray)
                            .font(.caption)
                        Text("3d")
                            .foregroundColor(.gray)
                            .font(.caption)
                    }
                    
                    // tweet caption
                    Text("Can't promise this deal lasts past today: 30% off a year, $1 for your first month.")
                        .multilineTextAlignment(.leading)
                    
                    Text("247sports.com/college/missou...")
                        .foregroundColor(.blue)
                    
                    Image("postImage")
                        .resizable()
                        .frame(width: UIScreen.main.bounds.width - 90, height: 200)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                }
                .offset(x: -5)
            }
            
            //  buttons
            HStack {
                // when the icon is clicked it changes to the new icon
                Button{
                    
                }label: {
                    Image(systemName: currentSymbol)
                        .font(.subheadline)
                        .onTapGesture {
                            withAnimation{
                                currentSymbol = (currentSymbol == "message") ? "message.badge" : "message"
                            }
                        }
                        .contentTransition(.symbolEffect(.replace))
                }
                
                Spacer()
                
                // rotates the icon when clicked
                Button{
                    
                }label: {
                    Image(systemName: "arrow.2.squarepath")
                        .font(.subheadline)
                        .onTapGesture {
                            withAnimation {
                                isRotated.toggle()
                            }
                        }
                        .rotationEffect(isRotated ? .degrees(180) : .degrees(0))
                }
                
                Spacer()
                
                // when the icon is clicked it changes to the new icon
                Button{
                    
                }label: {
                    Image(systemName: currentSymbol3)
                        .font(.subheadline)
                        .onTapGesture {
                            withAnimation{
                                currentSymbol3 = (currentSymbol3 == "heart") ? "heart.fill" : "heart"
                            }
                        }
                        .contentTransition(.symbolEffect(.replace))
                }
                
                Spacer()
                
                // when the icon is clicked it changes to the new icon
                Button{
                    
                }label: {
                    Image(systemName: currentSymbol4)
                        .font(.subheadline)
                        .onTapGesture {
                            withAnimation{
                                currentSymbol4 = (currentSymbol4 == "bookmark") ? "bookmark.fill" : "bookmark"
                            }
                        }
                        .contentTransition(.symbolEffect(.replace))
                }
            }
            
            .padding()
            .foregroundColor(.gray)
            
            Divider()
        }
        //.padding(.vertical, 8)
    }
}

    
    
#Preview {
    TweetRowView()
}
