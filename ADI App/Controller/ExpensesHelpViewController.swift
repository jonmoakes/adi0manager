//
//  ExpensesHelpViewController.swift
//  ADI App
//
//  Created by Jonathan Oakes on 30/01/2019.
//  Copyright © 2019 Jonathan Oakes. All rights reserved.
//

import UIKit

class ExpensesHelpViewController: UIViewController {

    @IBOutlet var textVieew: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textVieew.applyRoundedCorners()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        textVieew.setContentOffset(CGPoint.zero, animated: false)
    }
    
    @IBAction func closeButtonTapped(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}
