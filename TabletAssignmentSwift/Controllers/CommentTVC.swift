//
//  CommentTVC.swift
//  TabletAssignmentSwift
//
//  Created by David Vallas on 4/9/16.
//  Copyright © 2016 FenixLabs. All rights reserved.
//

import UIKit

class CommentTVC: UITableViewController {
    
    @IBOutlet weak var postTextField: UITextField!
    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var footerView: UIView!
    
    @IBAction func donePressed(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
        postTextField.resignFirstResponder()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.scrollEnabled = true
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(keyboardWillShow(_:)), name: UIKeyboardWillShowNotification, object: nil)
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    /// notification that keyboard will show.  Assign the keyboard height to the presentation controller
    func keyboardWillShow(notification: NSNotification) {
        let userInfo:NSDictionary = notification.userInfo!
        let keyboardFrame:NSValue = userInfo.valueForKey(UIKeyboardFrameEndUserInfoKey) as! NSValue
        let keyboardRectangle = keyboardFrame.CGRectValue()
        let keyboardHeight = keyboardRectangle.height
        
        if let p = presentationController as? CommentPresentationController {
            p.keyBoardHeight = keyboardHeight
        }
    }
    
    override func viewWillTransitionToSize(size: CGSize, withTransitionCoordinator coordinator: UIViewControllerTransitionCoordinator) {
        coordinator.animateAlongsideTransition({ [unowned self] _ in
            self.postTextField.becomeFirstResponder()
            }) { _ in
            // do nothing
        }
    }
}

extension CommentTVC {
    
    override func tableView(tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        
        // makes the footer view static at bottom of screen
        var view: UIView?
        if section == tableView.numberOfSections - 1 {
            view = footerView
            footerView.removeFromSuperview()
        }
        return view
    }
    
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