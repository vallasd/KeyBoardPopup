//
//  CommentTVC.swift
//  TabletAssignmentSwift
//
//  Created by David Vallas on 4/9/16.


import UIKit

class CommentTVC: UITableViewController, UITextFieldDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.scrollEnabled = true
    }
}

extension CommentTVC {
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        // demo data (likesRow + replublishedRow + Comments)
        return 2 + CommentTVC.demoCommentCount
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        if indexPath.row < 2 { return 44.0 }
        return 100.0
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let row = indexPath.row
        
        // CommentMetaTVCell
        if row < 2 {
            
            let cellID = "commentMetaTVCell"
            let cell: CommentMetaTVCell = tableView.dequeueReusableCellWithIdentifier(cellID) as! CommentMetaTVCell
            
            // update CommentMetaTVCell
            if row == 0 {
                // demo data
                let likeCount = CommentTVC.demoLikesCount
                cell.titleLabel.text = "\(likeCount) people liked this"
            } else {
                // demo data
                let repubCount = CommentTVC.demoRepublishedCount
                cell.titleLabel.text = "\(repubCount) people republished this"
            }
            
            return cell
        }
        
        let cellID = "commentTVCell"
        // demo data
        let comment = CommentTVC.demoComment(atIndex: row - 2)
        let cell: CommentTVCell = tableView.dequeueReusableCellWithIdentifier(cellID) as! CommentTVCell
        cell.userImageView.circled()
        // update CommentTVCell
        cell.userImageView.image = UIImage(named: comment.user.imageName)
        cell.userNameLabel.text = comment.user.name
        cell.commentLabel.text = comment.message
        cell.commentAgeLabel.text = comment.commentDate.commentTime
        cell.likeCountLabel.text = String(comment.likes.count)
        
        return cell
    }
    
    override func tableView(tableView: UITableView, didDeselectRowAtIndexPath indexPath: NSIndexPath) {
        let row = indexPath.row
        print("Row \(row) pressed")
    }
}