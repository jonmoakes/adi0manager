//
//  AddPupilViewController.swift
//  ADI App
//
//  Created by Jonathan Oakes on 27/06/2018.
//  Copyright © 2018 Jonathan Oakes. All rights reserved.
//

import UIKit
import CoreData

class AddPupilViewController: UIViewController, UITextFieldDelegate, UITextViewDelegate {
    
    var managedObjectContext: NSManagedObjectContext!
    var pupilEntry: PupilEntries!

    @IBOutlet weak var topLabel: UILabel!
    @IBOutlet weak var bottomLabel: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var addressTextField: UITextField!
    @IBOutlet weak var pickUpAddressTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var phoneTextField: UITextField!
    @IBOutlet weak var phone2TextField: UITextField!
    @IBOutlet var dateOfBirthTextField: UITextField!
    @IBOutlet weak var licenceNumberTextField: UITextField!
    @IBOutlet var licenceExpiryTextField: UITextField!
    @IBOutlet weak var eyesightCheckedTextField: UITextField!
    @IBOutlet weak var glassesTextField: UITextField!
    @IBOutlet var medicalConditionsTextView: UITextView!
    @IBOutlet weak var experienceLevelTextField: UITextField!
    @IBOutlet weak var theoryPassedTextField: UITextField!
    @IBOutlet weak var theoryDateTextField: UITextField!
    @IBOutlet var theoryCertTextField: UITextField!
    @IBOutlet weak var drivingTestDateTextField: UITextField!
    @IBOutlet weak var drivingTestTimeTextField: UITextField!
    @IBOutlet weak var drivingTestLocationTextField: UITextField!
    @IBOutlet var theoryCertLabel: UILabel!
    @IBOutlet weak var drivingTestDateLabel: UILabel!
    @IBOutlet weak var drivingTestResultTextView: UITextView!
    @IBOutlet weak var drivingTestTimeLabel: UILabel!
    @IBOutlet weak var drivingTestLocationLabel: UILabel!
    @IBOutlet weak var drivingTestResultDescriptionLabel: UILabel!
    @IBOutlet weak var dTestResulLabel2: UILabel!
    @IBOutlet weak var theoryTestDateLabel: UILabel!
    @IBOutlet var messageIcon: UIBarButtonItem!
    @IBOutlet var callIcon: UIBarButtonItem!
    
    let dateOfBirthDatePicker = UIDatePicker()
    let licenceExpiryDatePicker = UIDatePicker()
    let theoryTestDatePicker = UIDatePicker()
    let drivingTestDatePicker = UIDatePicker()
    let drivingTestTimePicker = UIDatePicker()
    let eyesightPicker = UIDatePicker()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemOrange
        createDateOfBirthDatePicker()
        createLicenceExpiryDatePicker()
        createTheoryTestDatePicker()
        createDrivingTestDatePicker()
        createDrivingTestTimePicker()
        createEyesightDatePicker()
        
        nameTextField.applyRoundedCorners()
        addressTextField.applyRoundedCorners()
        pickUpAddressTextField.applyRoundedCorners()
        emailTextField.applyRoundedCorners()
        phoneTextField.applyRoundedCorners()
        phone2TextField.applyRoundedCorners()
        dateOfBirthTextField.applyRoundedCorners()
        licenceNumberTextField.applyRoundedCorners()
        licenceExpiryTextField.applyRoundedCorners()
        eyesightCheckedTextField.applyRoundedCorners()
        medicalConditionsTextView.applyRoundedCorners()
        glassesTextField.applyRoundedCorners()
        experienceLevelTextField.applyRoundedCorners()
        theoryPassedTextField.applyRoundedCorners()
        theoryDateTextField.applyRoundedCorners()
        theoryCertTextField.applyRoundedCorners()
        drivingTestDateTextField.applyRoundedCorners()
        drivingTestTimeTextField.applyRoundedCorners()
        drivingTestLocationTextField.applyRoundedCorners()
        drivingTestResultTextView.applyRoundedCorners()
        
        topLabel.isHidden = true
        bottomLabel.isHidden = true
        
        theoryTestDateLabel.isHidden = true
        theoryDateTextField.isHidden = true
        theoryCertTextField.isHidden = true
        drivingTestDateTextField.isHidden = true
        drivingTestTimeTextField.isHidden = true
        drivingTestLocationTextField.isHidden = true
        drivingTestResultTextView.isHidden = true
        theoryCertLabel.isHidden = true
        drivingTestDateLabel.isHidden = true
        drivingTestTimeLabel.isHidden = true
        drivingTestLocationLabel.isHidden = true
        drivingTestResultDescriptionLabel.isHidden = true
        drivingTestResultDescriptionLabel.isHidden = true
        dTestResulLabel2.isHidden = true
        
        nameTextField.delegate = self
        addressTextField.delegate = self
        pickUpAddressTextField.delegate = self
        emailTextField.delegate = self
        phoneTextField.delegate = self
        phone2TextField.delegate = self
        dateOfBirthTextField.delegate = self
        licenceNumberTextField.delegate = self
        licenceExpiryTextField.delegate = self
        eyesightCheckedTextField.delegate = self
        medicalConditionsTextView.delegate = self
        glassesTextField.delegate = self
        experienceLevelTextField.delegate = self
        theoryPassedTextField.delegate = self
        theoryDateTextField.delegate = self
        theoryCertTextField.delegate = self
        drivingTestDateTextField.delegate = self
        drivingTestTimeTextField.delegate = self
        drivingTestLocationTextField.delegate = self
        
        if UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiom.pad  {
            callIcon.isEnabled = false
        }
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        managedObjectContext = appDelegate.persistentContainer.viewContext
        
        if pupilEntry != nil  {
            title = "Edit"
            nameTextField.text = pupilEntry.name
            addressTextField.text = pupilEntry.address
            pickUpAddressTextField.text = pupilEntry.pickUpAddress
            emailTextField.text = pupilEntry.email
            phoneTextField.text = pupilEntry.phoneNumber
            phone2TextField.text = pupilEntry.phone2
            dateOfBirthTextField.text = pupilEntry.dateOfBirth
            licenceNumberTextField.text = pupilEntry.licenceNumber
            licenceExpiryTextField.text = pupilEntry.licenceExpiry
            eyesightCheckedTextField.text = pupilEntry.eyesight
            medicalConditionsTextView.text = pupilEntry.medicalConditions
            glassesTextField.text = pupilEntry.glassesRequired
            experienceLevelTextField.text = pupilEntry.experienceLevel
            theoryPassedTextField.text = pupilEntry.theoryTestPassed
            theoryDateTextField.text = pupilEntry.theoryTestDate
            theoryCertTextField.text = pupilEntry.theoryCert
            drivingTestDateTextField.text = pupilEntry.drivingTestDate
            drivingTestTimeTextField.text = pupilEntry.drivingTestTime
            drivingTestLocationTextField.text = pupilEntry.drivingTestLocation
            drivingTestResultTextView.text = pupilEntry.drivingTestResultInfo
            if phoneTextField.text == "" {
                messageIcon.isEnabled = false
                callIcon.isEnabled = false
            }
        } else  {
            title = "Compose"
            messageIcon.isEnabled = false
            callIcon.isEnabled = false
        }
    }
    
    @IBAction func savePupilEntryButtonTapped(_ sender: Any) {
        if nameTextField.text == ""  {
            Alert.pupilFieldsAlert(on: self)
        } else if pupilEntry != nil  {
            Alert.SavedAlert(on: self)
            self.updateEntry()
            self.navigationController?.popToRootViewController(animated: true)
        } else  {
            if nameTextField.text != ""  {
                Alert.SavedAlert(on: self)
                self.createNewPupilEntry()
                self.navigationController?.popToRootViewController(animated: true)
            }
        }
    }
    
    
    @IBAction func callInfoButtonTapped(_ sender: Any) {
        Alert.pupilCallInfoAlert(on: self)
    }
    
  
    @IBAction func callButtonPressed(_ sender: Any) {
        if phoneTextField.text != "" && phone2TextField.text != "" && phone2TextField.text?.count == 11 && phone2TextField.text?.count == 11 {
            
            let callAlertController = UIAlertController(title: "Choose A Number To Call", message: "", preferredStyle: .alert)
            
            let primary = UIAlertAction(title: "Primary", style: .default, handler: { action in
                let url: NSURL = URL(string: "TEL://\(self.phoneTextField.text ?? "")")! as NSURL
                UIApplication.shared.open(url as URL, options: convertToUIApplicationOpenExternalURLOptionsKeyDictionary([:]), completionHandler: nil)
            })
            callAlertController.addAction(primary)
            
            let secondary = UIAlertAction(title: "Secondary", style: .default, handler: { action in
                let url: NSURL = URL(string: "TEL://\(self.phone2TextField.text ?? "")")! as NSURL
                UIApplication.shared.open(url as URL, options: convertToUIApplicationOpenExternalURLOptionsKeyDictionary([:]), completionHandler: nil)
            })
            callAlertController.addAction(secondary)
            
            let cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
            callAlertController.addAction(cancel)
            
            self.present(callAlertController, animated: true, completion: nil)
            
        } else if phoneTextField.text != "" && phoneTextField.text?.count == 11 {
            let url: NSURL = URL(string: "TEL://\(phoneTextField.text ?? "")")! as NSURL
            UIApplication.shared.open(url as URL, options: convertToUIApplicationOpenExternalURLOptionsKeyDictionary([:]), completionHandler: nil)
            
        } else  {
            Alert.pupilCallErrorAlert(on: self)
        }
    }
    
    
    @IBAction func messageButtonPressed(_ sender: Any) {
        if phoneTextField.text != "" && phone2TextField.text != "" && phone2TextField.text?.count == 11 && phone2TextField.text?.count == 11 {
            
            let messageAlertController = UIAlertController(title: "Choose A Number To Text", message: "", preferredStyle: .alert)
            
            let primary = UIAlertAction(title: "Primary", style: .default, handler: { action in
                let url: NSURL = URL(string: "sms://\(self.phoneTextField.text ?? "")")! as NSURL
                UIApplication.shared.open(url as URL, options: convertToUIApplicationOpenExternalURLOptionsKeyDictionary([:]), completionHandler: nil)
            })
            messageAlertController.addAction(primary)
            
            let secondary = UIAlertAction(title: "Secondary", style: .default, handler: { action in
                let url: NSURL = URL(string: "sms://\(self.phone2TextField.text ?? "")")! as NSURL
                UIApplication.shared.open(url as URL, options: convertToUIApplicationOpenExternalURLOptionsKeyDictionary([:]), completionHandler: nil)
            })
            messageAlertController.addAction(secondary)
            
            let cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
            messageAlertController.addAction(cancel)
            
            self.present(messageAlertController, animated: true, completion: nil)
            
        }  else if phoneTextField.text != "" && phoneTextField.text?.count == 11 {
            let url: NSURL = URL(string: "sms:\(phoneTextField.text ?? "")")! as NSURL
            UIApplication.shared.open(url as URL, options: convertToUIApplicationOpenExternalURLOptionsKeyDictionary([:]), completionHandler: nil)
        } else  {
            Alert.pupilCallErrorAlert(on: self)
        }
    }
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == nameTextField  {
            addressTextField.becomeFirstResponder()
        } else if textField == addressTextField  {
            pickUpAddressTextField.becomeFirstResponder()
        } else if textField == pickUpAddressTextField  {
            emailTextField.becomeFirstResponder()
        } else if textField == emailTextField  {
            phoneTextField.becomeFirstResponder()
        } else if textField == phoneTextField {
            phone2TextField.becomeFirstResponder()
        } else if textField == phone2TextField {
            dateOfBirthTextField.becomeFirstResponder()
        } else if textField == dateOfBirthTextField {
            licenceNumberTextField.becomeFirstResponder()
        } else if textField == licenceNumberTextField  {
            licenceExpiryTextField.becomeFirstResponder()
        } else if textField == licenceExpiryTextField {
            eyesightCheckedTextField.becomeFirstResponder()
        } else if textField == eyesightCheckedTextField {
            medicalConditionsTextView.becomeFirstResponder()
        } else if textField == medicalConditionsTextView {
            glassesTextField.becomeFirstResponder()
        } else if textField == glassesTextField  {
            experienceLevelTextField.becomeFirstResponder()
        }
        return true
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        showHiddenFields()
        return true
    }
    
    func showHiddenFields()  {
        if theoryPassedTextField.text == "No" || theoryPassedTextField.text == "no"  {
            theoryTestDateLabel.isHidden = false
            theoryDateTextField.isHidden = false
            theoryDateTextField.placeholder = "Tap To Enter Date"
            theoryDateTextField.isEnabled = true
        }  else if theoryPassedTextField.text == "Yes" || theoryPassedTextField.text == "yes" {
            theoryDateTextField.isEnabled = false
            theoryDateTextField.placeholder = "Enter 'No' Above To Enable This Field"
            theoryTestDateLabel.isHidden = false
            theoryDateTextField.isHidden = false
            theoryCertTextField.isHidden = false
            theoryCertLabel.isHidden = false
            drivingTestDateLabel.isHidden = false
            drivingTestDateTextField.isHidden = false
            drivingTestTimeLabel.isHidden = false
            drivingTestTimeTextField.isHidden = false
            drivingTestLocationLabel.isHidden = false
            drivingTestLocationTextField.isHidden = false
            drivingTestResultDescriptionLabel.isHidden = false
            dTestResulLabel2.isHidden = false
            drivingTestResultTextView.isHidden = false
        } else if  theoryPassedTextField.text == ""  {
            theoryTestDateLabel.isHidden = false
            theoryDateTextField.isHidden = false
            theoryDateTextField.placeholder = "Tap To Enter Date"
            theoryDateTextField.isEnabled = true
        } 
    }
    
    override func viewDidAppear(_ animated: Bool) {
        showHiddenFields()
    }
    
    func updateEntry()  {
        pupilEntry.name = self.nameTextField.text
        pupilEntry.address = self.addressTextField.text
        pupilEntry.pickUpAddress = self.pickUpAddressTextField.text
        pupilEntry.email = self.emailTextField.text
        pupilEntry.phoneNumber = self.phoneTextField.text
        pupilEntry.phone2 = self.phone2TextField.text
        pupilEntry.dateOfBirth = self.dateOfBirthTextField.text
        pupilEntry.licenceNumber = self.licenceNumberTextField.text
        pupilEntry.licenceExpiry = self.licenceExpiryTextField.text
        pupilEntry.eyesight = self.eyesightCheckedTextField.text
        pupilEntry.medicalConditions = self.medicalConditionsTextView.text
        pupilEntry.glassesRequired = self.glassesTextField.text
        pupilEntry.experienceLevel = self.experienceLevelTextField.text
        pupilEntry.theoryTestPassed = self.theoryPassedTextField.text
        pupilEntry.theoryTestDate = self.theoryDateTextField.text
        pupilEntry.theoryCert = self.theoryCertTextField.text
        pupilEntry.drivingTestDate = self.drivingTestDateTextField.text
        pupilEntry.drivingTestTime = self.drivingTestTimeTextField.text
        pupilEntry.drivingTestLocation = self.drivingTestLocationTextField.text
        pupilEntry.drivingTestResultInfo = self.drivingTestResultTextView.text
        
        do  {
            try managedObjectContext.save()
        } catch let error as NSError  {
            print("Could Not Save The New Entry \(error.localizedDescription)")
        }
    }
    
    func createNewPupilEntry()  {
        let pupilEntryEntity = NSEntityDescription.entity(forEntityName: "PupilEntries", in: managedObjectContext)!
        let newPupilEntry = PupilEntries(entity: pupilEntryEntity, insertInto: managedObjectContext)
        
        newPupilEntry.name = self.nameTextField.text
        newPupilEntry.address = self.addressTextField.text
        newPupilEntry.pickUpAddress = self.pickUpAddressTextField.text
        newPupilEntry.email = self.emailTextField.text
        newPupilEntry.phoneNumber = self.phoneTextField.text
        newPupilEntry.phone2 = self.phone2TextField.text
        newPupilEntry.dateOfBirth = self.dateOfBirthTextField.text
        newPupilEntry.licenceNumber = self.licenceNumberTextField.text
        newPupilEntry.licenceExpiry = self.licenceExpiryTextField.text
        newPupilEntry.eyesight = self.eyesightCheckedTextField.text
        newPupilEntry.medicalConditions = self.medicalConditionsTextView.text
        newPupilEntry.glassesRequired = self.glassesTextField.text
        newPupilEntry.experienceLevel = self.experienceLevelTextField.text
        newPupilEntry.theoryTestPassed = self.theoryPassedTextField.text
        newPupilEntry.theoryTestDate = self.theoryDateTextField.text
        newPupilEntry.theoryCert = self.theoryCertTextField.text
        newPupilEntry.drivingTestDate = self.drivingTestDateTextField.text
        newPupilEntry.drivingTestTime = self.drivingTestTimeTextField.text
        newPupilEntry.drivingTestLocation = self.drivingTestLocationTextField.text
        newPupilEntry.drivingTestResultInfo = self.drivingTestResultTextView.text
        
        do  {
            try managedObjectContext.save()
        } catch let error as NSError  {
            print("Could Not Save The New Entry \(error.localizedDescription)")
        }
    }
    
    func createDateOfBirthDatePicker() {
        let dateOfBirthDatePicker = UIDatePicker()
        if #available(iOS 13.4, *) {
            dateOfBirthDatePicker.preferredDatePickerStyle = .wheels
        }
        
        let dateOfBirthToolbar = UIToolbar()
        dateOfBirthToolbar.sizeToFit()
        
        let dateOfBirthDoneButton = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(dateOfBirthPickerViewDoneButtonPressed))
        dateOfBirthToolbar.setItems([dateOfBirthDoneButton], animated: true)
        
        dateOfBirthTextField.inputAccessoryView = dateOfBirthToolbar
        dateOfBirthTextField.inputView = dateOfBirthDatePicker
        dateOfBirthDatePicker.datePickerMode = .date
    }
    
    @objc func dateOfBirthPickerViewDoneButtonPressed() {
        let dateOfBirthFormatter = DateFormatter()
        dateOfBirthFormatter.dateStyle = .full
        dateOfBirthFormatter.timeStyle = .none
    
        let dateOfBirthDateString = dateOfBirthFormatter.string(from: dateOfBirthDatePicker.date)
        dateOfBirthTextField.text = "\(dateOfBirthDateString)"
        self.view.endEditing(true)
    }
    
    func createLicenceExpiryDatePicker() {
        let licenceExpiryDatePicker = UIDatePicker()
        if #available(iOS 13.4, *) {
            licenceExpiryDatePicker.preferredDatePickerStyle = .wheels
        }
        
        let licenceExpiryToolbar = UIToolbar()
        licenceExpiryToolbar.sizeToFit()
        
        let licenceExpiryDoneButton = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(licenceExpiryPickerViewDoneButtonPressed))
        licenceExpiryToolbar.setItems([licenceExpiryDoneButton], animated: true)
        
        licenceExpiryTextField.inputAccessoryView = licenceExpiryToolbar
        licenceExpiryTextField.inputView = licenceExpiryDatePicker
        licenceExpiryDatePicker.datePickerMode = .date
    }
    
    @objc func licenceExpiryPickerViewDoneButtonPressed() {
        let licenceExpiryFormatter = DateFormatter()
        licenceExpiryFormatter.dateStyle = .full
        licenceExpiryFormatter.timeStyle = .none
    
        let licenceExpiryDateString = licenceExpiryFormatter.string(from: licenceExpiryDatePicker.date)
        licenceExpiryTextField.text = "\(licenceExpiryDateString)"
        self.view.endEditing(true)
    }
    
    func createEyesightDatePicker() {
        let eyesightPicker = UIDatePicker()
        if #available(iOS 13.4, *) {
            eyesightPicker.preferredDatePickerStyle = .wheels
        }
        
        let eyesightToolbar = UIToolbar()
        eyesightToolbar.sizeToFit()
    
        let eyesightDoneButton = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(eyesightPickerViewDoneButtonPressed))
        eyesightToolbar.setItems([eyesightDoneButton], animated: true)
    
        eyesightCheckedTextField.inputAccessoryView = eyesightToolbar
        eyesightCheckedTextField.inputView = eyesightPicker
        eyesightPicker.datePickerMode = .date
    }
    
    @objc func eyesightPickerViewDoneButtonPressed() {
        let eyesightFormatter = DateFormatter()
        eyesightFormatter.dateStyle = .full
        eyesightFormatter.timeStyle = .none
    
        let eyesightDateString = eyesightFormatter.string(from: eyesightPicker.date)
        eyesightCheckedTextField.text = "\(eyesightDateString)"
        self.view.endEditing(true)
    }
    
    func createTheoryTestDatePicker()  {
        let theoryTestDatePicker = UIDatePicker()
        if #available(iOS 13.4, *) {
            theoryTestDatePicker.preferredDatePickerStyle = .wheels
        }
        
        let theoryDateToolbar = UIToolbar()
        theoryDateToolbar.sizeToFit()
        
        let theoryDateDoneButton = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(theoryDatePickerViewDoneButtonPressed))
        theoryDateToolbar.setItems([theoryDateDoneButton], animated: true)
        
        theoryDateTextField.inputAccessoryView = theoryDateToolbar
        theoryDateTextField.inputView = theoryTestDatePicker
        theoryTestDatePicker.datePickerMode = .date
    }
    
    @objc func  theoryDatePickerViewDoneButtonPressed()  {
        let theoryFormatter = DateFormatter()
        theoryFormatter.dateStyle = .full
        theoryFormatter.timeStyle = .none
        
        let theoryDateString = theoryFormatter.string(from: theoryTestDatePicker.date)
        
        theoryDateTextField.text = "\(theoryDateString)"
        self.view.endEditing(true)
    }
    
    func createDrivingTestDatePicker()  {
        let drivingTestDatePicker = UIDatePicker()
        if #available(iOS 13.4, *) {
            drivingTestDatePicker.preferredDatePickerStyle = .wheels
        }
        
        let dTestdateToolbar = UIToolbar()
        dTestdateToolbar.sizeToFit()
        
        let dTestdoneButton = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(dTestdatePickerViewDoneButtonPressed))
        dTestdateToolbar.setItems([dTestdoneButton], animated: true)
        
        drivingTestDateTextField.inputAccessoryView = dTestdateToolbar
        drivingTestDateTextField.inputView = drivingTestDatePicker
        drivingTestDatePicker.datePickerMode = .date
    }
    
    @objc func  dTestdatePickerViewDoneButtonPressed()  {
        let dTestDateformatter = DateFormatter()
        dTestDateformatter.dateStyle = .full
        dTestDateformatter.timeStyle = .none
        
        let dTestdateString = dTestDateformatter.string(from: drivingTestDatePicker.date)
        drivingTestDateTextField.text = "\(dTestdateString)"
        self.view.endEditing(true)
    }

    func createDrivingTestTimePicker()  {
        let drivingTestTimePicker = UIDatePicker()
        if #available(iOS 13.4, *) {
            drivingTestTimePicker.preferredDatePickerStyle = .wheels
        }
        let timeToolbar = UIToolbar()
        timeToolbar.sizeToFit()
        
        let timeDoneButton = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(dTestTimePickerViewDoneButtonPressed))
        timeToolbar.setItems([timeDoneButton], animated: true)
        
        drivingTestTimeTextField.inputAccessoryView = timeToolbar
        drivingTestTimeTextField.inputView = drivingTestTimePicker
        drivingTestTimePicker.datePickerMode = .time
    }
    
    @objc func  dTestTimePickerViewDoneButtonPressed()  {
        let formatter = DateFormatter()
        formatter.dateStyle = .none
        formatter.timeStyle = .short
        
        let timeString = formatter.string(from: drivingTestTimePicker.date)
        drivingTestTimeTextField.text = "\(timeString)"
        self.view.endEditing(true)
    }
}

// Helper function inserted by Swift 4.2 migrator.
fileprivate func convertToUIApplicationOpenExternalURLOptionsKeyDictionary(_ input: [String: Any]) -> [UIApplication.OpenExternalURLOptionsKey: Any] {
    return Dictionary(uniqueKeysWithValues: input.map { key, value in (UIApplication.OpenExternalURLOptionsKey(rawValue: key), value)})
}
