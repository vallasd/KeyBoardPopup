//
//  CommentPresentationController.swift
//  TabletAssignmentSwift
//
//  Created by David Vallas on 4/9/16.


import UIKit

class CommentPresentationController: UIPresentationController, UIAdaptivePresentationControllerDelegate {
    
    var chromeView: UIView = UIView()
    var keyBoardHeight: CGFloat = 0.0
    
    let headerBuffer: CGFloat = 20.0
    let keyBoardBuffer: CGFloat = 8.0
    
    override init(presentedViewController: UIViewController, presenting presentingViewController: UIViewController?) {
        super.init(presentedViewController:presentedViewController, presenting:presentingViewController)
        setupChrome()
    }
    
    func setupChrome() {
        chromeView.backgroundColor = UIColor(white:0.0, alpha:0.4)
        chromeView.alpha = 0.0
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.chromeViewTapped(_:)))
        chromeView.addGestureRecognizer(tap)
    }
    
    func chromeViewTapped(_ gesture: UIGestureRecognizer) {
        if (gesture.state == UIGestureRecognizerState.ended) {
            presentingViewController.dismiss(animated: true, completion: nil)
        }
    }
    
    override var frameOfPresentedViewInContainerView : CGRect {
        var presentedViewFrame = CGRect.zero
        let containerBounds = containerView!.bounds
        presentedViewFrame.size = size(forChildContentContainer: presentedViewController, withParentContainerSize: containerBounds.size)
        presentedViewFrame.origin.x = containerBounds.size.width - presentedViewFrame.size.width
        presentedViewFrame.origin.y = headerBuffer
        return presentedViewFrame
    }
    
    override func size(forChildContentContainer container: UIContentContainer, withParentContainerSize parentSize: CGSize) -> CGSize {
        
        var height: CGFloat = parentSize.height
        
        // assign keyboard height if it exists
        if keyBoardHeight != 0 {
            height = CGFloat((floorf(Float(parentSize.height - keyBoardHeight - keyBoardBuffer))))
        }
        
        let size = CGSize(width: parentSize.width, height: height - headerBuffer)
        return size
    }
    
    override func presentationTransitionWillBegin() {
        chromeView.frame = self.containerView!.bounds
        chromeView.alpha = 0.0
        containerView!.insertSubview(chromeView, at:0)
        let coordinator = presentedViewController.transitionCoordinator
        if (coordinator != nil) {
            coordinator!.animate(alongsideTransition: {
                (context:UIViewControllerTransitionCoordinatorContext!) -> Void in
                self.chromeView.alpha = 1.0
                self.presentedView?.alpha = 1.0
                }, completion:nil)
        } else {
            chromeView.alpha = 1.0
            self.presentedView?.alpha = 1.0
        }
    }
    
    override func dismissalTransitionWillBegin() {
        let coordinator = presentedViewController.transitionCoordinator
        if (coordinator != nil) {
            coordinator!.animate(alongsideTransition: {
                (context:UIViewControllerTransitionCoordinatorContext!) -> Void in
                self.chromeView.alpha = 0.0
                self.presentedView?.alpha = 0.0
                }, completion:nil)
        } else {
            chromeView.alpha = 0.0
            self.presentedView?.alpha = 0.0
        }
    }
    
    override func containerViewWillLayoutSubviews() {
        chromeView.frame = containerView!.bounds
        presentedView!.frame = frameOfPresentedViewInContainerView
    }
    
    override var shouldPresentInFullscreen : Bool {
        return true
    }
    
    override var adaptivePresentationStyle : UIModalPresentationStyle {
        return UIModalPresentationStyle.fullScreen
    }
    
//    func adaptivePresentationStyleForPresentationController(controller: UIPresentationController) -> UIModalPresentationStyle {
//        return UIModalPresentationStyle.Popover
//    }
    
}
