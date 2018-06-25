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
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_:)), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
    }
    
    /// notification that keyboard will show.  Assign the keyboard height to the presentation controller
    func keyboardWillShow(_ notification: Notification) {
        
        let userInfo:NSDictionary = (notification as NSNotification).userInfo! as NSDictionary
        let keyboardFrame:NSValue = userInfo.value(forKey: UIKeyboardFrameEndUserInfoKey) as! NSValue
        let keyboardRectangle = keyboardFrame.cgRectValue
        let keyboardHeight = keyboardRectangle.height
        
        if let p = presentationController as? CommentPresentationController {
            p.keyBoardHeight = keyboardHeight
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let segueName = segue.identifier
        
        if segueName == "embededCommentHeaderVC" {
            let vc = segue.destination as! CommentHeaderVC
            vc.delegate = self
        }
        
        if segueName == "embededCommentFooterVC" {
            let vc = segue.destination as! CommentFooterVC
            vc.delegate = self
        }
    }
}

extension CommentVC: CommentHeaderDelegate {
    
    
    func donePressed() {
        textField.resignFirstResponder()
        dismiss(animated: true, completion: nil)
    }
    
}

extension CommentVC: CommentFooterDelegate {
    
    func textFieldSet(textField tf: UITextField) {
        tf.becomeFirstResponder()
        textField = tf
    }
    
}
