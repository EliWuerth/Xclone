//
//  NewTweetView.swift
//  XClone
//
//  Created by Eli Wuerth on 12/5/24.
//

import SwiftUI

struct NewTweetView: View {
    @State private var text = ""
       @Environment(\.presentationMode) var presentationMode
       var body: some View {
           VStack {
               HStack {
                   Button {
                       presentationMode.wrappedValue.dismiss()
                   } label: {
                       Text("Cancel")
                           .foregroundColor(Color(.systemBlue))
                   }
                   Spacer()
                   Button {
                       // Implement your tweet action here
                       print("Tweet")
                       // Optionally dismiss the view after tweeting
                       presentationMode.wrappedValue.dismiss()
                   } label: {
                       Text("Tweet")
                           .bold()
                           .padding(.horizontal)
                           .padding(.vertical, 8)
                           .background (Color(.systemBlue))
                           .foregroundColor(.white)
                           .clipShape (Capsule())
                   }
               }
               .padding()
               
               HStack(alignment: .top, spacing: 4) {
                       Circle()
                           .frame(width: 64, height: 64)
                       
                       TextArea(text: $text, placeholder: "TweetTweet")
                           .foregroundColor(Color.gray.opacity(0.8)) // Background for visibility
                   }
           }
       }
   }

   #Preview {
       NewTweetView()
   }
