//
//  TweetFilterViewsModel.swift
//  twitterX
//
//  Created by Eli Wuerth on 10/14/24.
//

import Foundation

enum TweetFilterViewsModel: Int, CaseIterable {
    case tweets
    case replies
    case likes
    
    var title: String {
        switch self {
        case .tweets: return "Tweets"
        case .replies: return "Replies"
        case .likes: return "Likes"
        }
    }
}
