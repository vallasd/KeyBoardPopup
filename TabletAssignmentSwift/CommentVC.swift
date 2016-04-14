//
//  CommentVC.swift
//  TabletAssignmentSwift
//
//  Created by David Vallas on 4/12/16.

import Foundation


import UIKit

class CommentVC: UIViewController {
    
    weak var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(keyboardWillShow(_:)), name: UIKeyboardWillShowNotification, object: nil)
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
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        let segueName = segue.identifier
        
        if segueName == "embededCommentHeaderVC" {
            let vc = segue.destinationViewController as! CommentHeaderVC
            vc.delegate = self
        }
        
        if segueName == "embededCommentFooterVC" {
            let vc = segue.destinationViewController as! CommentFooterVC
            vc.delegate = self
        }
    }
}

extension CommentVC: CommentHeaderDelegate {
    
    
    func donePressed() {
        textField.resignFirstResponder()
        dismissViewControllerAnimated(true, completion: nil)
    }
    
}

extension CommentVC: CommentFooterDelegate {
    
    func textFieldSet(textField tf: UITextField) {
        tf.becomeFirstResponder()
        textField = tf
    }
    
}