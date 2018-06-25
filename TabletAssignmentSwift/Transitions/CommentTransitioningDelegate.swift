//
//  CommentTransitioningDelegate.swift
//  TabletAssignmentSwift
//
//  Created by David Vallas on 4/9/16.


import UIKit

class CommentTransitioningDelegate: NSObject, UIViewControllerTransitioningDelegate {
    
    func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
        let presentationController = CommentPresentationController(presentedViewController:presented, presentingViewController:presenting!)
        return presentationController
    }
    
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        let animationController = CommentAnimatedTransitioning()
        animationController.isPresentation = true
        return animationController
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        let animationController = CommentAnimatedTransitioning()
        animationController.isPresentation = false
        return animationController
    }
    
}
