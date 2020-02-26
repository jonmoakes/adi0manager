//
//  AddIncomeViewController.swift
//  ADI App
//
//  Created by Jonathan Oakes on 26/03/2019.
//  Copyright © 2019 Jonathan Oakes. All rights reserved.
//

import UIKit
import CoreData
import MessageUI

class AddIncomeViewController: UIViewController, UITextFieldDelegate, MFMailComposeViewControllerDelegate, UIImagePickerControllerDelegate {
    
    var managedObjectContext: NSManagedObjectContext!
    var incomeEntry: IncomeEntries!
    
    @IBOutlet var dateTextField: UITextField!
    @IBOutlet var incomeReceivedTextField: UITextField!
    @IBOutlet var saveButton: UIBarButtonItem!
    @IBOutlet var emailButton: UIBarButtonItem!
    @IBOutlet var emailTextField: UITextField!
    @IBOutlet var nameTextField: UITextField!
    
    @objc let datePicker = UIDatePicker()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        createDatePicker()
        incomeReceivedTextField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        nameTextField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        emailTextField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)

        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        managedObjectContext = appDelegate.persistentContainer.viewContext
        if incomeEntry != nil  {
            title = "Edit"
            
            nameTextField.text = incomeEntry.name
            dateTextField.text = incomeEntry.date
            emailTextField.text = incomeEntry.email
            incomeReceivedTextField.text = incomeEntry.incomeAmount
            saveButton.isEnabled = false
            emailButton.isEnabled = false
            
            
            
        }  else  {
            title = "Compose"
            emailTextField.isEnabled = false
            emailTextField.alpha = 0.5
            emailButton.isEnabled = false
        }
        
    }
    
    @IBAction func saveButtonPressed(_ sender: Any) {
        if dateTextField.text == "" || incomeReceivedTextField.text == ""  {
            Alert.calculateErrorAlert(on: self)
        } else if incomeEntry != nil  {
            Alert.SavedAlert(on: self)
            self.updateEntry()
            self.navigationController?.popToRootViewController(animated: true)
        } else  {
            if dateTextField.text != ""  {
                Alert.SavedAlert(on: self)
                self.createNewIncomeEntry()
                self.navigationController?.popToRootViewController(animated: true)
            }
        }
    }
   
    @IBAction func emailButtonTapped(_ sender: Any) {
        if MFMailComposeViewController.canSendMail() {
            if  emailTextField.text == ""  {
                let alert = UIAlertController(title: "Alert", message: "Please Fill In Your Email Address In The text Field Provided", preferredStyle: UIAlertController.Style.alert)
                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                self.present(alert, animated: true, completion: nil)
            }
            
            let toRecipients = [emailTextField.text]
            
            let mc: MFMailComposeViewController = MFMailComposeViewController()
            
            mc.mailComposeDelegate = self
            
            mc.setToRecipients(toRecipients as? [String])
            mc.setSubject("Income Invoice On \(dateTextField.text!)\n ( Format Is Month Then Date )")
            
            mc.setMessageBody("Here Is Your Income Invoice For Your Records.\n\nDate:\n( Format Is Month Then Date )\n\(dateTextField.text!)\n\nPupil's Name:\n\(nameTextField.text!)\n\nTotal Income:\n£\(incomeReceivedTextField.text!)", isHTML: false)
            
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
    
    @objc func textFieldDidChange(_ textField: UITextField) {
        saveButton.isEnabled = true
        if emailTextField.text != "" {
            emailButton.isEnabled = true
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        saveButton.isEnabled = true
    }
    
    func updateEntry()  {
        incomeEntry.date = self.dateTextField.text
        incomeEntry.incomeAmount = self.incomeReceivedTextField.text
        incomeEntry.name = self.nameTextField.text
        if emailTextField.text != "" {
            incomeEntry.email = self.emailTextField.text
        }
        
        do  {
            try managedObjectContext.save()
        } catch let error as NSError  {
            print("Could Not Save The New Entry \(error.localizedDescription)")
        }
    }
    
    func createNewIncomeEntry()  {
        let incomeEntryEntity = NSEntityDescription.entity(forEntityName: "IncomeEntries", in: managedObjectContext)!
        let newIncomeEntry = IncomeEntries(entity: incomeEntryEntity, insertInto: managedObjectContext)
        
        newIncomeEntry.date = self.dateTextField.text
        newIncomeEntry.incomeAmount = self.incomeReceivedTextField.text
        newIncomeEntry.name = self.nameTextField.text
    
        
        do  {
            try managedObjectContext.save()
        } catch let error as NSError  {
            print("Could Not Save The New Entry \(error.localizedDescription)")
        }
    }
    
    // Start of code to create the date picker and the done button in the toolbar
    func createDatePicker()  {
        // create toolbar
        let dateToolbar = UIToolbar()
        dateToolbar.sizeToFit()
        
        // create done button for toolbar
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(datePickerViewDoneButtonPressed))
        dateToolbar.setItems([doneButton], animated: true)
        
        dateTextField.inputAccessoryView = dateToolbar
        dateTextField.inputView = datePicker
        
        datePicker.datePickerMode = .date
        datePicker.addTarget(self, action: #selector(datePickerChanged(picker:)), for: .valueChanged)
    }
    
    @objc func datePickerChanged(picker: UIDatePicker) {
        saveButton.isEnabled = true
    }
    
    @objc func  datePickerViewDoneButtonPressed()  {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy    MM-dd,     EEEE"
        
        let dateString = formatter.string(from: datePicker.date)
        
        dateTextField.text = "\(dateString)"
        if saveButton.isEnabled == false {
            saveButton.isEnabled = true
        }
        
        self.view.endEditing(true)
    }
    // End of code that creates date picker and toolbar.
}


    /*  /For future calculating totals
    func textFieldDidBeginEditing(_ textField: UITextField) {
        calculateButton.isEnabled = true
    }
    
    func showCalculateButtonToolbar()  {
        let calculateButtonToolbar = UIToolbar()
        calculateButtonToolbar.sizeToFit()
        
        let showCalculateButtonDoneButton = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(showCalculateButtonDoneButtonPressed))
        calculateButtonToolbar.setItems([showCalculateButtonDoneButton], animated: true)
        incomeReceivedTextField.inputAccessoryView = calculateButtonToolbar
    }
    
    @objc func  showCalculateButtonDoneButtonPressed()  {
         if  dateTextField.text != "" && incomeReceivedTextField.text != "" && totalReceivedTextField.text != ""  {
            calculateButton.isEnabled = true
        }
        self.view.endEditing(true)
    }
 
 
     @IBAction func calculateButtonPressed(_ sender: Any) {
     if incomeReceivedTextField.text == "" {
     Alert.calculateErrorAlert(on: self)
     } else {
     guard let incomeReceived = incomeReceivedTextField.text else { return }
     guard let incomeReceivedAsDouble = Double(incomeReceived) else { return }
     
     guard let totalReceived = totalReceivedTextField.text else { return }
     guard let totalReceivedAsDouble = Double(totalReceived) else { return }
     
     let grandTotal = incomeReceivedAsDouble + totalReceivedAsDouble
     
     let showAmount2DecimalPlaces = String(format: "%.2f", grandTotal)
     
     totalReceivedTextField.text = String(showAmount2DecimalPlaces)
     saveButton.isEnabled = true
     calculateButton.isEnabled = false
     }
     
     }
     */
    

