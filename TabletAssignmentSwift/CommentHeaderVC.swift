//
//  CommentHeaderVC.swift
//  TabletAssignmentSwift
//
//  Created by David Vallas on 4/12/16.


import UIKit

protocol CommentHeaderDelegate: AnyObject {
    func donePressed()
}

class CommentHeaderVC: UIViewController {
    
    weak var delegate: CommentHeaderDelegate?
    
    @IBAction func donePressed(sender: AnyObject) {
        delegate?.donePressed()
    }

}