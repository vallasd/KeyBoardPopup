//
//  Comment.swift
//  TabletAssignmentSwift
//
//  Created by David Vallas on 4/9/16.


import Foundation


struct Comment {
    
    let user: User
    let message: String
    let commentDate: Double
    let likes: [User]
    
    init(user u: User, message m: String, commentDate cd: Double, likes l: [User]) {
        user = u
        message = m
        commentDate = cd
        likes = l
    }
}