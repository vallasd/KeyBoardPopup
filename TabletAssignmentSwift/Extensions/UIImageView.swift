//
//  UIImage.swift
//  TabletAssignmentSwift
//
//  Created by David Vallas on 4/9/16.


import UIKit
import Foundation

extension UIImageView {
    
    /// creates a circled image of image in imageView's rect
    func circled() {
        
        self.layer.cornerRadius = self.frame.height / 2.0
        self.clipsToBounds = true
    }
    
}