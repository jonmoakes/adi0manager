//
//  HomeScreenViewController.swift
//  ADI App
//
//  Created by Jonathan Oakes on 27/06/2018.
//  Copyright © 2018 Jonathan Oakes. All rights reserved.
//

import UIKit
import SafariServices

class HomeScreenViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
        override var preferredStatusBarStyle: UIStatusBarStyle {
            return .lightContent
        }
}

extension UITextField {
    func applyRoundedCorners() {
        self.layer.cornerRadius = 5.0
        self.layer.borderColor = UIColor(white: 0, alpha: 0.15).cgColor
        self.layer.borderWidth = 1.0
        self.layer.masksToBounds = true
    }
}

extension UITextView {
    func applyRoundedCorners() {
        self.layer.cornerRadius = 5.0
        self.layer.borderColor = UIColor(white: 0, alpha: 0.15).cgColor
        self.layer.borderWidth = 1.0
        self.layer.masksToBounds = true
        self.textContainerInset = UIEdgeInsets(top: 10,left: 10,bottom: 10,right: 10)
    }
}

extension UILabel {
    func applyRoundedCorners() {
        self.layer.cornerRadius = 5.0
        self.layer.borderColor = UIColor(white: 0, alpha: 0.15).cgColor
        self.layer.borderWidth = 1.0
        self.layer.masksToBounds = true
    }
}

extension UIButton {
    func applyRoundedCorners() {
        self.layer.cornerRadius = 10.0
        self.layer.borderColor = UIColor(white: 0, alpha: 0.15).cgColor
        self.layer.borderWidth = 1.0
        self.layer.masksToBounds = true
    }
}


