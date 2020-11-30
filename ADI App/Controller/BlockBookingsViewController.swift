//
//  BlockBookingsViewController.swift
//  ADI App
//
//  Created by Jonathan Oakes on 11/02/2019.
//  Copyright © 2019 Jonathan Oakes. All rights reserved.
//

import UIKit
import CoreData
import MessageUI

class BlockBookingsViewController: UIViewController, MFMailComposeViewControllerDelegate {
    
    var managedObjectContext: NSManagedObjectContext!
    var blockEntries: PupilEntries!

    @IBOutlet var topLabel: UILabel!
    @IBOutlet var bottomLabel: UILabel!
    @IBOutlet var clearDataButton: UIButton!
    @IBOutlet var emailButton: UIBarButtonItem!
    @IBOutlet var saveButton: UIBarButtonItem!
    
    @IBOutlet var paymentTakenTextField: UITextField!
    @IBOutlet var latestLessonDateTextField: UITextField!
    @IBOutlet var lessonLengthTextField: UITextField!
    @IBOutlet var blockBookingDateTextField: UITextField!
    @IBOutlet var hoursPurchasedTextField: UITextField!
    @IBOutlet var remainingHoursTextField: UITextField!
    
    let datePicker = UIDatePicker()
    let latestLessonDatePicker = UIDatePicker()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemOrange
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        managedObjectContext = appDelegate.persistentContainer.viewContext
        
        let firstNameOnly = blockEntries.name
        let word = firstNameOnly?.components(separatedBy: " ").first
        
        title = "\(word!)'s Block"
        
        createDatePicker()
        createLessonDatePicker()

        topLabel.isHidden = true
        bottomLabel.isHidden = true
        
        blockBookingDateTextField.text = blockEntries.date
        paymentTakenTextField.text = blockEntries.blockPaymentTaken
        hoursPurchasedTextField.text = blockEntries.hoursPurchased
        latestLessonDateTextField.text = blockEntries.blockLatestLessonDate
        lessonLengthTextField.text = blockEntries.blockLessonLength
        remainingHoursTextField.text = blockEntries.remainingHours
    }
    
    @IBAction func saveButtonPressed(_ sender: Any) {
        
        if blockBookingDateTextField.text == "" && paymentTakenTextField.text == "" && hoursPurchasedTextField.text == "" && latestLessonDateTextField.text == "" && lessonLengthTextField.text == "" && remainingHoursTextField.text == "" {
            Alert.blockBookingFieldErrorAlert(on: self)
        } else {
            Alert.SavedAlert(on: self)
            self.updateEntry()
        }
    }
    
    @IBAction func emailButtonPressed(_ sender: Any) {
        let userEmail = blockEntries.email
      
        if MFMailComposeViewController.canSendMail()  {
            if  userEmail == ""  {
                let alert = UIAlertController(title: "Alert", message: "Please Make Sure You Have Entered The Pupil's Email In The 'Info' Section Of The Pupils Tab. Don't Forget To Save It Once You Have Entered It.", preferredStyle: UIAlertController.Style.alert)
                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                self.present(alert, animated: true, completion: nil)
            }
            
            let firstNameOnly = blockEntries.name
            let word = firstNameOnly?.components(separatedBy: " ").first
            
            let toRecipients = [userEmail]
            
            let mc: MFMailComposeViewController = MFMailComposeViewController()
            
            mc.mailComposeDelegate = self
            
            mc.setToRecipients(toRecipients as? [String])
            mc.setSubject("Your Block Booking Receipt")
            
            mc.setMessageBody("Hi \(word ?? "Pupil")!\n\nHere Is Your Receipt For Your Recent Block Booking For Your Driving Lessons. Please Keep It Safe For Your Records.\n\nName:\n\(blockEntries.name!)\n\nPayment Date:\n\(blockEntries.date ?? "")\n\nPayment Taken:\n£\(blockEntries.blockPaymentTaken ?? "")\n\nHours Purchased:\n\(blockEntries.hoursPurchased ?? "")\n\nLatest Lesson Date:\n\(blockEntries.blockLatestLessonDate ?? "")\n\nLength Of Latest Completed Lesson:\n\(blockEntries.blockLessonLength ?? "") Hour(s)\n\nRemaining Hours On Block Booking After Latest Lesson Was Completed:\n\(blockEntries.remainingHours ?? "") Hour(s)\n\nKind Regards", isHTML: false)
            
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
            Alert.showSuccessEmailSentMessage(on: self)
        default:
            break
        }
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func clearButtonPressed(_ sender: Any) {
        let deleteAlertController = UIAlertController(title: "Are You Sure?", message: "", preferredStyle: .alert)
        
        let imSure = UIAlertAction(title: "Yes", style: .destructive) { (action) in
            self.blockBookingDateTextField.text = ""
            self.paymentTakenTextField.text = ""
            self.hoursPurchasedTextField.text = ""
            self.lessonLengthTextField.text = ""
            self.remainingHoursTextField.text = ""
            self.latestLessonDateTextField.text = ""
            self.clearEntry()
        }
        deleteAlertController.addAction(imSure)
        
        let cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        deleteAlertController.addAction(cancel)
        
        self.present(deleteAlertController, animated: true, completion: nil)
    }
    
    func updateEntry()  {
        blockEntries.date = self.blockBookingDateTextField.text
        blockEntries.blockPaymentTaken = self.paymentTakenTextField.text
        blockEntries.hoursPurchased = self.hoursPurchasedTextField.text
        blockEntries.blockLessonLength = self.lessonLengthTextField.text
        blockEntries.remainingHours = self.remainingHoursTextField.text
        blockEntries.blockLatestLessonDate = self.latestLessonDateTextField.text
            
        do  {
            try managedObjectContext.save()
        } catch let error as NSError  {
            print("Could Not Save The New Entry \(error.localizedDescription)")
        }
    }
    
    func clearEntry() {
        blockEntries.date = ""
        blockEntries.blockPaymentTaken = ""
        blockEntries.hoursPurchased = ""
        blockEntries.blockLessonLength = ""
        blockEntries.remainingHours = ""
        blockEntries.blockLatestLessonDate = ""
        do  {
            try self.managedObjectContext.save()
            Alert.blockBookingClearedDataAlert(on: self)
        } catch let error as NSError  {
            print("Could Not Save The New Entry \(error.localizedDescription)")
        }
    }
    
    func createDatePicker()  {
        if #available(iOS 13.4, *) {
            datePicker.preferredDatePickerStyle = .wheels
        }
        
        let dateToolbar = UIToolbar()
        dateToolbar.sizeToFit()
        
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(datePickerViewDoneButtonPressed))
        dateToolbar.setItems([doneButton], animated: true)
        
        blockBookingDateTextField.inputAccessoryView = dateToolbar
        blockBookingDateTextField.inputView = datePicker
        
        datePicker.datePickerMode = .date
    }
    
    @objc func  datePickerViewDoneButtonPressed()  {
        let formatter = DateFormatter()
        formatter.dateStyle = .full
        
        let dateString = formatter.string(from: datePicker.date)
        blockBookingDateTextField.text = "\(dateString)"
        self.view.endEditing(true)
    }
    
    func createLessonDatePicker()  {
        if #available(iOS 13.4, *) {
            latestLessonDatePicker.preferredDatePickerStyle = .wheels
        }
        
        let lessonDateToolbar = UIToolbar()
        lessonDateToolbar.sizeToFit()
        
        let lessonDateDoneButton = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(latestLessonDatePickerViewDoneButtonPressed))
        lessonDateToolbar.setItems([lessonDateDoneButton], animated: true)
        
        latestLessonDateTextField.inputAccessoryView = lessonDateToolbar
        latestLessonDateTextField.inputView = latestLessonDatePicker
        latestLessonDatePicker.datePickerMode = .date
    }
    
    @objc func  latestLessonDatePickerViewDoneButtonPressed()  {
        let lFormatter = DateFormatter()
        lFormatter.dateStyle = .full
        
        let dateString = lFormatter.string(from: latestLessonDatePicker.date)
        latestLessonDateTextField.text = "\(dateString)"
        self.view.endEditing(true)
    }
}
