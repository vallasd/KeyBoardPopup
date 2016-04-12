//
//  CommentAnimatedTransitioning.swift
//  TabletAssignmentSwift
//
//  Created by David Vallas on 4/9/16.


import UIKit

class CommentAnimatedTransitioning: NSObject, UIViewControllerAnimatedTransitioning {
    
    var isPresentation : Bool = false
    
    var keyboardHeight : CGFloat = 400.00
    
    func transitionDuration(transitionContext: UIViewControllerContextTransitioning?) -> NSTimeInterval {
        return 0.3
    }
    
    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        
        let fromVC = transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey)
        let toVC = transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey)
        let fromView = fromVC?.view
        let toView = toVC?.view
        let containerView = transitionContext.containerView()
        
        if isPresentation {
            containerView!.addSubview(toView!)
        }
        
        let animatingVC = isPresentation ? toVC : fromVC
        let animatingView = animatingVC?.view
        
        var finalFrameForVC = transitionContext.finalFrameForViewController(animatingVC!)
        var initialFrameForVC = finalFrameForVC
        
        // Set Initial frame data
        initialFrameForVC.origin.y += initialFrameForVC.size.height;
        initialFrameForVC.size.width = initialFrameForVC.size.width / 3.0;
        initialFrameForVC.size.height = initialFrameForVC.size.height / 3.0;
        
        if keyboardHeight != 0 {
            finalFrameForVC.size.height = finalFrameForVC.size.height - keyboardHeight - 8.0
        }
        
        let initialFrame = isPresentation ? initialFrameForVC : finalFrameForVC
        let finalFrame = isPresentation ? finalFrameForVC : initialFrameForVC
        
        animatingView?.frame = initialFrame
        
        UIView.animateWithDuration(transitionDuration(transitionContext), delay:0, usingSpringWithDamping:300.0, initialSpringVelocity:5.0, options:UIViewAnimationOptions.AllowUserInteraction, animations:{
            animatingView?.frame = finalFrame
            }, completion:{ (value: Bool) in
                if !self.isPresentation {
                    fromView?.removeFromSuperview()
                }
                transitionContext.completeTransition(true)
        })
    }
}
