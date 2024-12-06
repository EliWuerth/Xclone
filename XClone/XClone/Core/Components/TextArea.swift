//
//  TextArea.swift
//  XClone
//
//  Created by Eli Wuerth on 12/5/24.
//

import SwiftUI

struct TextArea: View {
    @Binding var text: String
    let placeholder: String
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            // Show placeholder text when the text is empty
            if text.isEmpty {
                Text(placeholder)
                    .foregroundColor(.gray)
                    .background(Color.white)
                    .padding(.horizontal, 8)
                    .padding(.vertical, 12)
            }
            
            // TextEditor for user input
            TextEditor(text: $text)
                .padding(4)
                .frame(minHeight: 100)
                .foregroundColor(.gray)
                .background(Color.white)
                .font(.body)
        }
        .font(.body)
    }
}
