//
//  IncomeHelpViewController.swift
//  ADI App
//
//  Created by Jonathan Oakes on 26/03/2019.
//  Copyright © 2019 Jonathan Oakes. All rights reserved.
//

import UIKit

class IncomeHelpViewController: UIViewController {

    @IBOutlet var textView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func closeTapped(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        textView.setContentOffset(CGPoint.zero, animated: false)
    }
    
    

}
