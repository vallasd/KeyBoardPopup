//
//  CommentAnimatedTransitioning.swift
//  TabletAssignmentSwift
//
//  Created by David Vallas on 4/9/16.


import UIKit

class CommentAnimatedTransitioning: NSObject, UIViewControllerAnimatedTransitioning {
    
    var isPresentation : Bool = false
    
    var keyboardHeight : CGFloat = 400.00
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.3
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        
        let fromVC = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.from)
        let toVC = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.to)
        let fromView = fromVC?.view
        let toView = toVC?.view
        let containerView = transitionContext.containerView
        
        if isPresentation {
            containerView.addSubview(toView!)
        }
        
        let animatingVC = isPresentation ? toVC : fromVC
        let animatingView = animatingVC?.view
        
        var finalFrameForVC = transitionContext.finalFrame(for: animatingVC!)
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
        
        UIView.animate(withDuration: transitionDuration(using: transitionContext), delay:0, usingSpringWithDamping:300.0, initialSpringVelocity:5.0, options:UIViewAnimationOptions.allowUserInteraction, animations:{
            animatingView?.frame = finalFrame
            }, completion:{ (value: Bool) in
                if !self.isPresentation {
                    fromView?.removeFromSuperview()
                }
                transitionContext.completeTransition(true)
        })
    }
}
