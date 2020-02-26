//
//  DiaryHelpViewController.swift
//  ADI App
//
//  Created by Jonathan Oakes on 25/01/2019.
//  Copyright © 2019 Jonathan Oakes. All rights reserved.
//

import UIKit

class DiaryHelpViewController: UIViewController {

    @IBOutlet var textView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textView.applyRoundedCorners()
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        textView.setContentOffset(CGPoint.zero, animated: false)
    }
    
    @IBAction func closeButtonTapped(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}
