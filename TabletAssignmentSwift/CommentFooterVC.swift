//
//  CommentFooterVC.swift
//  TabletAssignmentSwift
//
//  Created by David Vallas on 4/12/16.

import Foundation


import UIKit

protocol CommentFooterDelegate: AnyObject {
    
    func textFieldSet(textField tf: UITextField)
}


class CommentFooterVC: UIViewController {
    
    @IBOutlet weak var postTextField: UITextField!
    
    weak var delegate: CommentFooterDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        delegate?.textFieldSet(textField: postTextField)
    }
}