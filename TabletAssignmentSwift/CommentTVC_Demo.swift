//
//  CommentTVC_Demo.swift
//  TabletAssignmentSwift
//
//  Created by David Vallas on 4/9/16.


import Foundation


// Class used to demo functionality of CommentTVC_demo cells before model is implemented.  This represents a comment section for one object.
class CommentTVC_demo {
    
    static let shared = CommentTVC_demo()

    let likes: [User]
    let republished: [User]
    let comments: [Comment]
    
    init() {
        
        // create users
        let user1 = User(name: "Space", imageName: "astronaut")
        let user2 = User(name: "Garret", imageName: "avatar2")
        let user3 = User(name: "Lisa", imageName: "avatar1")
        let user4 = User(name: "David", imageName: "david")
        
        // create dates
        let today = NSDate()
        let hours22Ago = today.dateByAddingTimeInterval(-79200.0)
        let yesterday = today.dateByAddingTimeInterval(-86400.0)
        let day3sago = today.dateByAddingTimeInterval(-259200.0)
        
        // create comments
        let comment1 = Comment(user: user1, message: "#space #NASA #history", commentDate: day3sago.double, likes: [])
        let comment2 = Comment(user: user2, message: "My comment without a hash", commentDate: hours22Ago.double, likes: [user3, user4])
        let comment3 = Comment(user: user3, message: "So what! #hash in between", commentDate: yesterday.double, likes: [user2])
        let comment4 = Comment(user: user4, message: "Well my hash is at the end #last", commentDate: today.double, likes: [])
        
        // update properties
        likes = [user1, user2, user3]
        republished = [user1, user4]
        comments = [comment1, comment2, comment3, comment4]
    }
    
}


// Extension used to demo populated cells
extension CommentTVC {
    
    static var demoLikesCount: Int {
        return CommentTVC_demo.shared.likes.count
    }
    
    static var demoRepublishedCount: Int {
        return CommentTVC_demo.shared.republished.count
    }
    
    static var demoCommentCount: Int {
        return CommentTVC_demo.shared.comments.count
    }
    
    static func demoComment(atIndex i: Int) -> Comment {
        return CommentTVC_demo.shared.comments[i]
    }
    
}