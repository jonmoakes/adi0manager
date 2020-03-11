//
//  EmailUsViewController.swift
//  ADI App
//
//  Created by Jonathan Oakes on 04/01/2019.
//  Copyright © 2019 Jonathan Oakes. All rights reserved.
//

import UIKit
import MessageUI

class EmailUsViewController: UIViewController, MFMailComposeViewControllerDelegate {

    @IBOutlet var topLabel: UILabel!
    @IBOutlet var bottomLabel: UILabel!
    @IBOutlet var nameTextField: UITextField!
    @IBOutlet var emailTextField: UITextField!
    @IBOutlet var messageTextField: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        topLabel.isHidden = true
        bottomLabel.isHidden = true
        nameTextField.applyRoundedCorners()
        emailTextField.applyRoundedCorners()
        messageTextField.applyRoundedCorners()
        view.backgroundColor = .systemOrange
    }
    
    @IBAction func backButtonPressed(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
    @IBAction func emailButtonPressed(_ sender: Any) {
        if MFMailComposeViewController.canSendMail()  {
            if  emailTextField.text == "" || nameTextField.text == "" || messageTextField.text == "" {
                let alert = UIAlertController(title: "Error", message: "Please Make Sure That The Name, Email And Message Fields Are Filled In To Send An Email.", preferredStyle: UIAlertController.Style.alert)
                
                alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
                
                self.present(alert, animated: true, completion: nil)
            }
            let toRecipients = ["jonathan@eosappsandwebsites.co.uk"]
            let mc: MFMailComposeViewController = MFMailComposeViewController()
            mc.mailComposeDelegate = self
            mc.setToRecipients(toRecipients)
            mc.setSubject("Enquiry")
            mc.setMessageBody("Name: \n\(nameTextField.text!) \n\nEmail: \n\(emailTextField.text!)\n\nMessage: \n\(messageTextField.text!)", isHTML: false)
            
            self.present(mc, animated: true, completion: nil)
        } else {
            Alert.showNoEmailAccountFoundError(on: self)
        }
    }
    
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        switch result.rawValue {
        case MFMailComposeResult.cancelled.rawValue:
            Alert.showEmailCancelledMessage(on: self)
            
        case MFMailComposeResult.failed.rawValue:
            Alert.showEmailFailedMessage(on: self)
            
        case MFMailComposeResult.saved.rawValue:
            Alert.showEmailSavedMessage(on: self)
            
        case MFMailComposeResult.sent.rawValue:
            Alert.showEmailSentMessage(on: self)
            
        default:
            break
        }
        self.dismiss(animated: true, completion: nil)
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if messageTextField.textColor == UIColor.lightGray {
            messageTextField.text = nil
            messageTextField.textColor = UIColor.black
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if messageTextField.text.isEmpty {
            messageTextField.text = "Required"
            messageTextField.textColor = .systemGray
        }
    }
}
