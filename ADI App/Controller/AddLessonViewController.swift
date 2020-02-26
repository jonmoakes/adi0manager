//
//  AddLessonViewController.swift
//  ADI App
//
//  Created by Jonathan Oakes on 27/06/2018.
//  Copyright © 2018 Jonathan Oakes. All rights reserved.
//

import UIKit
import CoreData
import MessageUI

class AddLessonViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate, MFMailComposeViewControllerDelegate, UITextFieldDelegate {
    
    var managedObjectContext: NSManagedObjectContext!
    var lessonEntry : LessonEntries!
    
    var yourEmail = ""
    
    let paidFieldAnswers = ["Please Select", "Yes", "No"]
    let paymentMethods = ["Please Select", "Cash", "Cheque", "Card", "Bank Transfer"]
    
    @IBOutlet var emailButton: UIBarButtonItem!
    @IBOutlet var scrollView: UIScrollView!
    @IBOutlet weak var topLabel: UILabel!
    @IBOutlet weak var bottomLabel: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var dateTextField: UITextField!
    @IBOutlet var lessonStartTimeLabel: UILabel!
    @IBOutlet weak var lessonStartTimeTextField: UITextField!
    @IBOutlet var lessonEndTimeLabel: UILabel!
    @IBOutlet weak var lessonLengthTextField: UITextField!
    @IBOutlet weak var paidPickerView: UIPickerView!
    @IBOutlet weak var paidPickerViewResultLabel: UILabel!
    @IBOutlet weak var amountreceivedTextField: UITextField!
    @IBOutlet weak var paymentMethodPickerView: UIPickerView!
    @IBOutlet weak var paymentMethodLabel: UILabel!
    @IBOutlet var balanceHoursLabel: UILabel!
    @IBOutlet weak var lessonSummaryTextView: UITextView!
    @IBOutlet weak var nextLessonPlanTextField: UITextField!
    @IBOutlet weak var nextLessonDateTextField: UITextField!
    @IBOutlet weak var nextLessonTimeTextField: UITextField!
    @IBOutlet weak var nextLessonPickupTextField: UITextField!
    @IBOutlet var paymentAmountTakenLabel: UILabel!
    @IBOutlet var selectAnOptionLabel: UILabel!
    @IBOutlet var ifNotPrePaidLabel: UILabel!
    @IBOutlet var blueDrivingTestLabel: UILabel!
    @IBOutlet var testLocationLabel: UILabel!
    @IBOutlet var testLocationTextField: UITextField!
    @IBOutlet var testResultLabel: UILabel!
    @IBOutlet var testResultTextView: UITextView!
    @IBOutlet var balanceHoursInfoLabel: UIButton!
    @IBOutlet var lessonSummaryLabel: UILabel!
    @IBOutlet var nextLessonPlanLabel: UILabel!
    @IBOutlet var nextLessonDateLabel: UILabel!
    @IBOutlet var nextLessonTimeLabel: UILabel!
    @IBOutlet var nextLessonPickUpLabel: UILabel!
    @IBOutlet var paidLabel: UILabel!
    @IBOutlet var drivingTestSwitch: UISwitch!
    let datePicker = UIDatePicker()
    let timePicker = UIDatePicker()
    let endTimePicker = UIDatePicker()
    let paidPicker = UIPickerView()
    let payMethodPicker = UIPickerView()
    let nextLessonDatePicker = UIDatePicker()
    let nextLessonTimePicker = UIDatePicker()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemOrange
        emailButton.isEnabled = false
        nameTextField.applyRoundedCorners()
        dateTextField.applyRoundedCorners()
        lessonLengthTextField.applyRoundedCorners()
        lessonLengthTextField.applyRoundedCorners()
        amountreceivedTextField.applyRoundedCorners()
        lessonSummaryTextView.applyRoundedCorners()
        nextLessonPlanTextField.applyRoundedCorners()
        nextLessonDateTextField.applyRoundedCorners()
        nextLessonTimeTextField.applyRoundedCorners()
        nextLessonPickupTextField.applyRoundedCorners()
        paidPickerViewResultLabel.applyRoundedCorners()
        paymentMethodLabel.applyRoundedCorners()
        testLocationTextField.applyRoundedCorners()
        testResultTextView.applyRoundedCorners()
        
        paidPickerViewResultLabel.text = ""
        paymentMethodLabel.text = ""
    
        blueDrivingTestLabel.isHidden = true
        testLocationLabel.isHidden = true
        testLocationTextField.isHidden = true
        testResultLabel.isHidden = true
        testResultTextView.isHidden = true
    
        topLabel.isHidden = true
        bottomLabel.isHidden = true
        createDatePicker()
        createTimePicker()
        createEndTimePicker()
        paidPickerView.delegate = self
        paidPickerView.dataSource = self
        paidPickerView.selectRow(0, inComponent: 0, animated: true)
        paymentMethodPickerView.delegate = self
        paymentMethodPickerView.dataSource = self
        createNextLessonDatePicker()
        createNextLessonTimePicker()
        amountreceivedTextField.isEnabled = false
        paymentMethodPickerView.isUserInteractionEnabled = false
        paymentMethodPickerView.alpha = 0.3
        selectAnOptionLabel.alpha = 0.3
        paymentAmountTakenLabel.alpha = 0.3
        ifNotPrePaidLabel.alpha = 0.3
        if paidPickerViewResultLabel.text == "Please Select" {
            paidPickerViewResultLabel.isHidden = true
        } else {
            paidPickerViewResultLabel.isHidden = false
        }
        if paymentMethodLabel.text == "Please Select" {
            paymentMethodLabel.isHidden = true
        } else {
            paymentMethodLabel.isHidden = false
        }
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        managedObjectContext = appDelegate.persistentContainer.viewContext
        
        if lessonEntry != nil  {
            title = "Edit "
            nameTextField.text = lessonEntry.pupilName
            dateTextField.text = lessonEntry.date
            lessonStartTimeTextField.text = lessonEntry.lessonStartTime
            lessonLengthTextField.text = lessonEntry.lessonEndTime
            paidPickerViewResultLabel.text = lessonEntry.pupilPaid
            amountreceivedTextField.text = lessonEntry.paymentAmountTaken
            paymentMethodLabel.text = lessonEntry.paymentMethod
            lessonSummaryTextView.text = lessonEntry.lessonSummary
            nextLessonPlanTextField.text = lessonEntry.nextLessonPlan
            nextLessonDateTextField.text = lessonEntry.nextLessonDate
            nextLessonTimeTextField.text = lessonEntry.nextLessonTime
            nextLessonPickupTextField.text = lessonEntry.nextLessonPickUp
            testLocationTextField.text = lessonEntry.testLocation
            testResultTextView.text = lessonEntry.testResult
        }  else  {
            title = "Compose"
        }
    }
// End of code and viewdidload
    @IBAction func drivingTestSwitchTapped(_ sender: Any) {
        
        if drivingTestSwitch.isOn {
            UserDefaults.standard.set((sender as AnyObject).isOn, forKey: "switchState")
            lessonEndTimeLabel.alpha = 0.5
            lessonLengthTextField.isEnabled = false
            lessonLengthTextField.alpha = 0.5
            paidLabel.alpha = 0.5
            paidPickerView.isUserInteractionEnabled = false
            paidPickerView.alpha = 0.5
            balanceHoursLabel.alpha = 0.5
            amountreceivedTextField.alpha = 0.5
            balanceHoursInfoLabel.isEnabled = false
            lessonSummaryLabel.alpha = 0.5
            lessonSummaryTextView.isUserInteractionEnabled = false
            lessonSummaryTextView.alpha = 0.5
            nextLessonPlanLabel.alpha = 0.5
            nextLessonPlanTextField.isEnabled = false
            nextLessonPlanTextField.alpha = 0.5
            nextLessonDateLabel.alpha = 0.5
            nextLessonDateTextField.isEnabled = false
            nextLessonDateTextField.alpha = 0.5
            nextLessonTimeLabel.alpha = 0.5
            nextLessonTimeTextField.isEnabled = false
            nextLessonTimeTextField.alpha = 0.5
            nextLessonPickUpLabel.alpha = 0.5
            nextLessonPickupTextField.isEnabled = false
            nextLessonPickupTextField.alpha = 0.5
            blueDrivingTestLabel.isHidden = false
            blueDrivingTestLabel.alpha = 1
            testLocationLabel.isHidden = false
            testLocationLabel.alpha = 1
            testLocationTextField.isHidden = false
            testLocationTextField.isEnabled = true
            testLocationTextField.alpha = 1
            testResultLabel.isHidden = false
            testResultLabel.alpha = 1
            testResultTextView.isHidden = false
            testResultTextView.isUserInteractionEnabled = true
            testResultTextView.alpha = 1
            scrollView.setContentOffset(CGPoint(x: 0, y: 1340), animated: true)
        } else  {
            lessonEndTimeLabel.alpha = 1
            lessonLengthTextField.isEnabled = true
            lessonLengthTextField.alpha = 1
            paidLabel.alpha = 1
            paidPickerView.isUserInteractionEnabled = true
            paidPickerView.alpha = 1
            balanceHoursLabel.alpha = 1
            amountreceivedTextField.alpha = 1
            balanceHoursInfoLabel.isEnabled = true
            lessonSummaryLabel.alpha = 1
            lessonSummaryTextView.isUserInteractionEnabled = true
            lessonSummaryTextView.alpha = 1
            nextLessonPlanLabel.alpha = 1
            nextLessonPlanTextField.isEnabled = true
            nextLessonPlanTextField.alpha = 1
            nextLessonDateLabel.alpha = 1
            nextLessonDateTextField.isEnabled = true
            nextLessonDateTextField.alpha = 1
            nextLessonTimeLabel.alpha = 1
            nextLessonTimeTextField.isEnabled = true
            nextLessonTimeTextField.alpha = 1
            nextLessonPickUpLabel.alpha = 1
            nextLessonPickupTextField.isEnabled = true
            nextLessonPickupTextField.alpha = 1
            blueDrivingTestLabel.alpha = 0.5
            testLocationLabel.alpha = 0.5
            testLocationTextField.isEnabled = false
            testLocationTextField.alpha = 0.5
            testResultLabel.alpha = 0.5
            testResultTextView.isUserInteractionEnabled = false
            testResultTextView.alpha = 0.5
        }
    }
    
    @IBAction func emailEnabledButtonPressed(_ sender: Any) {
        //1. Create the alert controller.
        let alert = UIAlertController(title: "Email Entry", message: "Enter The Email Address You Wish To Send This Entry To", preferredStyle: .alert)
        
        //2. Add the text field. You can configure it however you need.
        alert.addTextField { (textField) in
            textField.text = ""
        }
        
        // 3. Grab the value from the text field, and print it when the user clicks OK.
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [weak alert] (_) in
            let userEnteredEmail = alert?.textFields![0] // Force unwrapping because we know it exists.
            self.yourEmail = userEnteredEmail?.text ?? ""
            
            if MFMailComposeViewController.canSendMail()  {

                let firstNameOnly = self.nameTextField.text
                let word = firstNameOnly?.components(separatedBy: " ").first
                
                let toRecipients = [self.yourEmail]
                
                let mc: MFMailComposeViewController = MFMailComposeViewController()
                
                mc.mailComposeDelegate = self
                
                mc.setToRecipients(toRecipients)
                mc.setSubject("Driving Lesson Invoice For Your Lesson On \(self.dateTextField.text!)\n( Format Is Month Then Date )")
                
                if self.testLocationTextField.text != "" {
                    mc.setMessageBody("Hi there \(word ?? "")!\n\nHere Is Your Record From Your Test.\nPlease Keep It For Your Records.\n\nName:\n\(self.nameTextField.text!)\n\nDate: ( format Is Month Then Date )\n\(self.dateTextField.text!)\n\nStart Time:\n\(self.lessonStartTimeTextField.text ?? "")\n\nTest Centre:\n\(self.testLocationTextField.text ?? "")\n\nResult And Notes:\n\(self.testResultTextView.text ?? "")", isHTML: false)
                } else if self.testLocationTextField.text == "" {
                    mc.setMessageBody("Hi There \(word!)!\n\nHere Is Your Invoice From Your Lesson Today.\nPlease Keep For Your Records.\n\nName:\n\(self.nameTextField.text!)\n\nLesson Date: ( Format Is Month Then Date )\n\(self.dateTextField.text!)\n\nLesson Start Time:\n\(self.lessonStartTimeTextField.text!)\n\nLesson End Time:\n\(self.lessonLengthTextField.text!)\n\nLesson Paid For?\n\(self.paidPickerViewResultLabel.text!)\n\nPayment Amount Taken\n\(self.amountreceivedTextField.text!)\n\nPayment Method:\n\(self.paymentMethodLabel.text!)\n\nLesson Summary:\n\(self.lessonSummaryTextView.text!)\n\nNext Lesson Plan:\n\(self.nextLessonPlanTextField.text!)\n\nNext Lesson Date:\n\(self.nextLessonDateTextField.text!)\n\nNext Lesson Time:\n\(self.nextLessonTimeTextField.text!)\n\nNext Lesson Pick Up Point ( If Different From Normal ):\n\(self.nextLessonPickupTextField.text!)\n\nWell Done On Your Lesson Today!\n\nKind Regards", isHTML: false)
                }
                self.present(mc, animated: true, completion: nil)
            }  else {
                Alert.showNoEmailAccountFoundError(on: self)
            }
        }))
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        // 4. Present the alert.
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func infoButtonPressed(_ sender: Any) {
         Alert.LessonEmailInfoButtonTappedAlert(on: self)
    }
    
    @IBAction func blockBookedInffoButtonTapped(_ sender: Any) {
        Alert.LessonBlockBookingInfoButtonTappedAlert(on: self)
    }
    
    @IBAction func saveEntryButton(_ sender: Any) {
    
        if nameTextField.text == "" || dateTextField.text == "" {
            Alert.LessonFieldsErrorAlert(on: self)
        } else if lessonEntry != nil  {
            Alert.SavedAlert(on: self)
            self.updateEntry()
            self.navigationController?.popToRootViewController(animated: true)
        } else  {
            if nameTextField.text != "" && dateTextField.text != ""  {
                Alert.SavedAlert(on: self)
                self.createNewLessonEntry()
                self.navigationController?.popToRootViewController(animated: true)
            }
        }
    }

    func createNewLessonEntry()  {
        let lessonEntryEntity = NSEntityDescription.entity(forEntityName: "LessonEntries", in: managedObjectContext)!
        let newLessonEntry = LessonEntries(entity: lessonEntryEntity, insertInto: managedObjectContext)
        
        newLessonEntry.pupilName = self.nameTextField.text
        newLessonEntry.date = self.dateTextField.text
        newLessonEntry.lessonStartTime = self.lessonStartTimeTextField.text
        newLessonEntry.lessonEndTime = self.lessonLengthTextField.text
        newLessonEntry.pupilPaid = self.paidPickerViewResultLabel.text
        newLessonEntry.paymentAmountTaken = self.amountreceivedTextField.text
        newLessonEntry.paymentMethod = self.paymentMethodLabel.text
        newLessonEntry.lessonSummary = self.lessonSummaryTextView.text
        newLessonEntry.nextLessonPlan = self.nextLessonPlanTextField.text
        newLessonEntry.nextLessonDate = self.nextLessonDateTextField.text
        newLessonEntry.nextLessonTime = self.nextLessonTimeTextField.text
        newLessonEntry.nextLessonPickUp = self.nextLessonPickupTextField.text
        newLessonEntry.testLocation = self.testLocationTextField.text
        newLessonEntry.testResult = self.testResultTextView.text
        
        do  {
            try managedObjectContext.save()
        } catch let error as NSError  {
            print("Could Not Save The New Entry \(error.localizedDescription)")
        }
    }
    func updateEntry()  {
        lessonEntry.pupilName = self.nameTextField.text
        lessonEntry.date = self.dateTextField.text
        lessonEntry.lessonStartTime = self.lessonStartTimeTextField.text
        lessonEntry.lessonEndTime = self.lessonLengthTextField.text
        lessonEntry.pupilPaid = self.paidPickerViewResultLabel.text
        lessonEntry.paymentAmountTaken = self.amountreceivedTextField.text
        lessonEntry.paymentMethod = self.paymentMethodLabel.text
        lessonEntry.lessonSummary = self.lessonSummaryTextView.text
        lessonEntry.nextLessonPlan = self.nextLessonPlanTextField.text
        lessonEntry.nextLessonDate = self.nextLessonDateTextField.text
        lessonEntry.nextLessonTime = self.nextLessonTimeTextField.text
        lessonEntry.nextLessonPickUp = self.nextLessonPickupTextField.text
        lessonEntry.testLocation = self.testLocationTextField.text
        lessonEntry.testResult = self.testResultTextView.text
        
        do  {
            try managedObjectContext.save()
        } catch let error as NSError  {
            print("Could Not Save The New Entry \(error.localizedDescription)")
        }
    }
   
// Start of code that decides on cell background colour and enabled elements
    override func viewDidAppear(_ animated: Bool) {
        if paidPickerViewResultLabel.text == "Yes"  {
            paidPickerViewResultLabel.backgroundColor = UIColor.systemGreen
            paidPickerView.selectRow(1, inComponent: 0, animated: true)
            paymentMethodLabel.backgroundColor = UIColor.systemGreen
            amountreceivedTextField.isEnabled = true
            paymentMethodPickerView.isUserInteractionEnabled = true
            paymentMethodPickerView.alpha = 1
            selectAnOptionLabel.alpha = 1
            paymentAmountTakenLabel.alpha = 1
            ifNotPrePaidLabel.alpha = 1
            
        } else if paidPickerViewResultLabel.text == "No"  {
            paidPickerViewResultLabel.backgroundColor = UIColor.systemRed
            paidPickerView.selectRow(2, inComponent: 0, animated: true)
            paymentMethodLabel.alpha = 0.3
            amountreceivedTextField.placeholder = "Select 'Yes' Above To Enable"
            paymentAmountTakenLabel.alpha = 0.3
            paymentMethodLabel.isHidden = true
            
        } else if paidPickerViewResultLabel.text == "Please Select" {
            paidPickerView.selectRow(0, inComponent: 0, animated: true)
            paidPickerViewResultLabel.isHidden = true
            ifNotPrePaidLabel.alpha = 0.3
        }
        
        if paymentMethodLabel.text == "Please Select" {
            paymentMethodLabel.isHidden = true
            paymentMethodPickerView.selectRow(0, inComponent: 0, animated: true)
        } else if paymentMethodLabel.text == "Cash" {
            paymentMethodPickerView.selectRow(1, inComponent: 0, animated: true)
        } else if paymentMethodLabel.text == "Cheque" {
            paymentMethodPickerView.selectRow(2, inComponent: 0, animated: true)
        } else if paymentMethodLabel.text == "Card" {
            paymentMethodPickerView.selectRow(3, inComponent: 0, animated: true)
        } else if paymentMethodLabel.text == "Bank Transfer" {
            paymentMethodPickerView.selectRow(4, inComponent: 0, animated: true)
        } else {
            paymentMethodLabel.isHidden = false
        }
        
        if testLocationTextField.text != "" || testResultTextView.text != "" {
            drivingTestSwitch.isOn =  UserDefaults.standard.bool(forKey: "switchState")
            blueDrivingTestLabel.isHidden = false
            blueDrivingTestLabel.alpha = 1
            testLocationLabel.isHidden = false
            testLocationLabel.alpha = 1
            testLocationTextField.isHidden = false
            testLocationTextField.isEnabled = true
            testLocationTextField.alpha = 1
            testResultLabel.isHidden = false
            testResultLabel.alpha = 1
            testResultTextView.isHidden = false
            testResultTextView.isUserInteractionEnabled = true
            testResultTextView.alpha = 1
            scrollView.setContentOffset(CGPoint(x: 0, y: 1340), animated: true)
         
            lessonEndTimeLabel.alpha = 0.5
            lessonLengthTextField.isEnabled = false
            lessonLengthTextField.alpha = 0.5
            paidLabel.alpha = 0.5
            paidPickerView.isUserInteractionEnabled = false
            paidPickerView.alpha = 0.5
            balanceHoursLabel.alpha = 0.5
            amountreceivedTextField.alpha = 0.5
            balanceHoursInfoLabel.isEnabled = false
            lessonSummaryLabel.alpha = 0.5
            lessonSummaryTextView.isUserInteractionEnabled = false
            lessonSummaryTextView.alpha = 0.5
            nextLessonPlanLabel.alpha = 0.5
            nextLessonPlanTextField.isEnabled = false
            nextLessonPlanTextField.alpha = 0.5
            nextLessonDateLabel.alpha = 0.5
            nextLessonDateTextField.isEnabled = false
            nextLessonDateTextField.alpha = 0.5
            nextLessonTimeLabel.alpha = 0.5
            nextLessonTimeTextField.isEnabled = false
            nextLessonTimeTextField.alpha = 0.5
            nextLessonPickUpLabel.alpha = 0.5
            nextLessonPickupTextField.isEnabled = false
            nextLessonPickupTextField.alpha = 0.5
        }
        
        if lessonEntry != nil {
            emailButton.isEnabled = true
        }
    }
//End of code.
    
// Start of code that creates the two picker views.
    public func numberOfComponents(in pickerView: UIPickerView) -> Int  {
        return 1
    }
    
// Chooses what to return based on the pickers tag.
    public func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int  {
        if (pickerView.tag == 1){
            return paidFieldAnswers.count
        }else{
            return paymentMethods.count
        }
    }
    
// Chooses what title to display depending on which tag.
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if (pickerView.tag == 1){
            return "\(paidFieldAnswers[row])"
        }else {
            return "\(paymentMethods[row])"
        }
    }
    
// Chooses what happens whether the pupil has paid or not - what backgrounds are and what picker is enabled etc.
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int)  {
        if (pickerView.tag == 1)  {
            
            paidPickerViewResultLabel.text = paidFieldAnswers[row]
        
            if paidPickerViewResultLabel.text == "Yes"  {
                paidPickerViewResultLabel.isHidden = false
                paidPickerViewResultLabel.backgroundColor = UIColor.green
                amountreceivedTextField.isEnabled = true
                amountreceivedTextField.placeholder = "Enter The Amount Received"
                amountreceivedTextField.alpha = 1
                amountreceivedTextField.text = "£"
                selectAnOptionLabel.alpha = 1
                paymentAmountTakenLabel.alpha = 1
                ifNotPrePaidLabel.alpha = 1
                paymentMethodPickerView.isUserInteractionEnabled = true
                paymentMethodPickerView.alpha = 1
                paymentMethodLabel.alpha = 1
                paymentMethodLabel.isHidden = false
                
            }   else if paidPickerViewResultLabel.text == "No"  {
                paidPickerViewResultLabel.isHidden = false
                amountreceivedTextField.isEnabled = false
                paidPickerViewResultLabel.backgroundColor = UIColor.red
                amountreceivedTextField.placeholder = "Select 'Yes' To Enable This Field"
                paymentMethodPickerView.isUserInteractionEnabled = false
                paymentMethodPickerView.alpha = 0.3
                amountreceivedTextField.text = ""
                amountreceivedTextField.alpha = 0.3
                ifNotPrePaidLabel.alpha = 0.3
                selectAnOptionLabel.alpha = 0.3
                paymentAmountTakenLabel.alpha = 0.3
                paymentMethodLabel.isHidden = true
                
            } else if paidPickerViewResultLabel.text == "Please Select" {
                paidPickerViewResultLabel.isHidden = true
                paymentAmountTakenLabel.alpha = 0.3
                paymentMethodPickerView.alpha = 0.3
                paymentMethodPickerView.isUserInteractionEnabled = false
                ifNotPrePaidLabel.alpha = 0.3
                amountreceivedTextField.alpha = 0.3
                selectAnOptionLabel.alpha = 0.3
                paymentMethodLabel.isHidden = true
            }
        } else if (pickerView.tag == 2) {
            paymentMethodLabel.text = paymentMethods[row]
            if paymentMethodLabel.text == "Please Select" {
                paymentMethodLabel.isHidden = true
            } else {
                paymentMethodLabel.isHidden = false
                paymentMethodLabel.backgroundColor = UIColor.green
            }
        }
    }
    
// End of Picker Code
    
// Date And Time Pickers
    func createDatePicker()  {
        let dateToolbar = UIToolbar()
        dateToolbar.sizeToFit()
        
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(datePickerViewDoneButtonPressed))
        dateToolbar.setItems([doneButton], animated: true)
        
        dateTextField.inputAccessoryView = dateToolbar
        dateTextField.inputView = datePicker
        
        datePicker.datePickerMode = .date
    }
    
    @objc func  datePickerViewDoneButtonPressed()  {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy    MM-dd,   EEEE"
       
        let dateString = formatter.string(from: datePicker.date)
        
        dateTextField.text = "\(dateString)"
        self.view.endEditing(true)
    }
    
    func createTimePicker()  {
        let timeToolbar = UIToolbar()
        timeToolbar.sizeToFit()
        
        let timeDoneButton = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action:               #selector(timePickerViewDoneButtonPressed))
        timeToolbar.setItems([timeDoneButton], animated: true)
        
        lessonStartTimeTextField.inputAccessoryView = timeToolbar
        lessonStartTimeTextField.inputView = timePicker
        
        timePicker.datePickerMode = .time
    }
    
    @objc func  timePickerViewDoneButtonPressed()  {
        let timeFormatter = DateFormatter()
        timeFormatter.dateStyle = .none
        timeFormatter.locale = Locale(identifier: "en_GB")
        timeFormatter.timeStyle = .short
        
        let timeString = timeFormatter.string(from: timePicker.date)
        
        lessonStartTimeTextField.text = "\(timeString)"
        self.view.endEditing(true)
    }
    
    
    func createEndTimePicker()  {
        let endTimeToolbar = UIToolbar()
        endTimeToolbar.sizeToFit()
        
        let endTimeDoneButton = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action:               #selector(endTimePickerViewDoneButtonPressed))
        endTimeToolbar.setItems([endTimeDoneButton], animated: true)
        
        lessonLengthTextField.inputAccessoryView = endTimeToolbar
        lessonLengthTextField.inputView = endTimePicker
        
        endTimePicker.datePickerMode = .time
    }
    
    @objc func  endTimePickerViewDoneButtonPressed()  {
        let endTimeFormatter = DateFormatter()
        endTimeFormatter.dateStyle = .none
        endTimeFormatter.locale = Locale(identifier: "en_GB")
        endTimeFormatter.timeStyle = .short
        
        let endTimeString = endTimeFormatter.string(from: endTimePicker.date)
        
        lessonLengthTextField.text = "\(endTimeString)"
        self.view.endEditing(true)
    }
    
    func createNextLessonDatePicker()  {
        let nextLessonDateToolbar = UIToolbar()
        nextLessonDateToolbar.sizeToFit()
        
        let nextDateDoneButton = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(nextLessonDatePickerViewDoneButtonPressed))
        nextLessonDateToolbar.setItems([nextDateDoneButton], animated: true)
        
        nextLessonDateTextField.inputAccessoryView = nextLessonDateToolbar
        nextLessonDateTextField.inputView = nextLessonDatePicker
        
        nextLessonDatePicker.datePickerMode = .date
    }
    
    @objc func  nextLessonDatePickerViewDoneButtonPressed()  {
        let formatter = DateFormatter()
        formatter.dateStyle = .full
        formatter.timeStyle = .none
        
        let nextLessonDateString = formatter.string(from: nextLessonDatePicker.date)
        
        nextLessonDateTextField.text = "\(nextLessonDateString)"
        self.view.endEditing(true)
    }

    func createNextLessonTimePicker()  {
        let nextLessonTimeToolbar = UIToolbar()
        nextLessonTimeToolbar.sizeToFit()
        
        let nextLessonTimeDoneButton = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action:               #selector(nextLessonTimePickerViewDoneButtonPressed))
        nextLessonTimeToolbar.setItems([nextLessonTimeDoneButton], animated: true)
        
        nextLessonTimeTextField.inputAccessoryView = nextLessonTimeToolbar
        nextLessonTimeTextField.inputView = nextLessonTimePicker
        nextLessonTimePicker.datePickerMode = .time
    }
    
    @objc func  nextLessonTimePickerViewDoneButtonPressed()  {
        let timeFormatter = DateFormatter()
        timeFormatter.dateStyle = .none
        timeFormatter.timeStyle = .short
        
        let nextLessonTimeString = timeFormatter.string(from: nextLessonTimePicker.date)
        nextLessonTimeTextField.text = "\(nextLessonTimeString)"
        self.view.endEditing(true)
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
}


