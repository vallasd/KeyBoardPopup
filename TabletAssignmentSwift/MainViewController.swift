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
    @IBAction func barButtonTapped(_ sender: AnyObject) {
        transitioningDelegate = commentTransitionDelegate
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: "commentVC") as! CommentVC
        vc.modalPresentationStyle = UIModalPresentationStyle.custom
        vc.transitioningDelegate = commentTransitionDelegate
        present(vc, animated: true, completion: nil)
    }

}
