//
//  HomeScreenViewController.swift
//  ADI App
//
//  Created by Jonathan Oakes on 27/06/2018.
//  Copyright © 2018 Jonathan Oakes. All rights reserved.
//

import UIKit
import SafariServices
import LocalAuthentication

class HomeScreenViewController: UIViewController {

    @IBOutlet var diaryButton: UIBarButtonItem!
    @IBOutlet var lessonsButton: UIBarButtonItem!
    @IBOutlet var expensesButton: UIBarButtonItem!
    @IBOutlet var pupilsButton: UIBarButtonItem!
    @IBOutlet var helpButton: UIBarButtonItem!
    @IBOutlet var linksButton: UIBarButtonItem!
    @IBOutlet var emailButton: UIBarButtonItem!
    @IBOutlet var mainImage: UIImageView!
    @IBOutlet var versionNumberLabel: UILabel!
    @IBOutlet var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        diaryButton.isEnabled = false
        lessonsButton.isEnabled = false
        expensesButton.isEnabled = false
        pupilsButton.isEnabled = false
        linksButton.isEnabled = false
        helpButton.isEnabled = false
        emailButton.isEnabled = false
        mainImage.alpha = 0.3
        versionNumberLabel.alpha = 0.3
        loginButton.isEnabled = false
        loginButton.isHidden = true
        bioCheck()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    func bioCheck() {
        let context = LAContext()
        var error: NSError?
        
        if context.canEvaluatePolicy(.deviceOwnerAuthentication, error: &error) {
            let reason = "In Order That Only You Can Access The Data Within The App"
            
            context.evaluatePolicy(.deviceOwnerAuthentication, localizedReason: reason) { [ weak self ] success, authenticationError in
                DispatchQueue.main.async {
                    if success {
                        self?.diaryButton.isEnabled = true
                        self?.lessonsButton.isEnabled = true
                        self?.expensesButton.isEnabled = true
                        self?.pupilsButton.isEnabled = true
                        self?.linksButton.isEnabled = true
                        self?.helpButton.isEnabled = true
                        self?.emailButton.isEnabled = true
                        self?.mainImage.alpha = 1
                        self?.versionNumberLabel.alpha = 1
                        self?.loginButton.isHidden = true
                    } else {
                        print("Biometrics not verified")
                        self?.loginButton.isHidden = false
                        self?.loginButton.isEnabled = true
                        self?.mainImage.alpha = 0.1
                        self?.versionNumberLabel.alpha = 0.1
                        
                    }
                }
            }
        } else {
//            let ac = UIAlertController(title: "Biometry Unavailable", message: "Your Device Is Not configured For Biometric Authentication", preferredStyle: .alert)
//            ac.addAction(UIAlertAction(title: "Ok", style: .default))
//            ac.present(ac, animated: true)
            print("Not set up")
            loginButton.isHidden = false
            loginButton.setTitle("Touch Id Not Set Up",for: .normal)
            
        }
    }
    
    @IBAction func loginButtonTapped(_ sender: Any) {
        bioCheck()
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


