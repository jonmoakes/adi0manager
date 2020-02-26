//
//  HowToUseViewController.swift
//  ADI App
//
//  Created by Jonathan Oakes on 19/02/2019.
//  Copyright © 2019 Jonathan Oakes. All rights reserved.
//

import UIKit

class HowToUseViewController: UIViewController {

    @IBOutlet var textView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textView.setContentOffset(.zero, animated: true)
        textView.applyRoundedCorners()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        textView.setContentOffset(.zero, animated: true)
    }
    
    @IBAction func backButtonTapped(_ sender: Any) {
        performSegue(withIdentifier: "HowToToHome", sender: nil)
    }
    
    
}
