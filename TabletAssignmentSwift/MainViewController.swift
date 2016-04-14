//
//  MainViewController.swift
//  TabletAssignmentSwift
//
//  Created by David Vallas on 4/9/16.

import UIKit

private let reuseIdentifier = "Cell"

class MainViewController: UIViewController, UIPopoverPresentationControllerDelegate {
    
    let commentTransitionDelegate = CommentTransitioningDelegate()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Implementation
    @IBAction func barButtonTapped(sender: AnyObject) {
        transitioningDelegate = commentTransitionDelegate
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let vc = sb.instantiateViewControllerWithIdentifier("commentVC") as! CommentVC
        vc.modalPresentationStyle = UIModalPresentationStyle.Custom
        vc.transitioningDelegate = commentTransitionDelegate
        presentViewController(vc, animated: true, completion: nil)
    }

}
