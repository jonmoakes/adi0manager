//
//  AddTotalExpensesViewController.swift
//  ADI App
//
//  Created by Jonathan Oakes on 29/06/2018.
//  Copyright © 2018 Jonathan Oakes. All rights reserved.
//

import UIKit
import CoreData
import MessageUI


class AddTotalExpensesViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate, MFMailComposeViewControllerDelegate {
    
    var managedObjectContext: NSManagedObjectContext!
    var totalExpensesEntry : TotalExpenses!
    
    let months = ["Please Select", "January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]
    
    let years = ["Please Select", "2019", "2020", "2021", "2022", "2023", "2024","2025", "2026", "2027", "2028", "2029", "2030"]

    @IBOutlet var topLabel: UILabel!
    @IBOutlet var totalForWeekEndingLabel: UILabel!
    @IBOutlet var totalForMonthOfLabel: UILabel!
    @IBOutlet var monthPickerViewResultLabel: UILabel!
    @IBOutlet var totalExpensesForTheYearLabel: UILabel!
    @IBOutlet var yearPickerResultsLabel: UILabel!
    @IBOutlet var bottomLabel: UILabel!
    @IBOutlet var emailButton: UIButton!
    @IBOutlet var tapToEnterDateTextField: UITextField!
    @IBOutlet var enterAmountForWeekTextField: UITextField!
    @IBOutlet var enterTotalAmountForMonthtextField: UITextField!
    @IBOutlet var enterTotalAmountForYearTextField: UITextField!
    
    @IBOutlet var emailTextField: UITextField!
    @IBOutlet var totalForMonthPicker: UIPickerView!
    @IBOutlet var totalForYearPicker: UIPickerView!
    
    let datePicker = UIDatePicker()
    let monthPicker = UIPickerView()
    let yearPicker = UIPickerView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tapToEnterDateTextField.applyRoundedCorners()
        enterAmountForWeekTextField.applyRoundedCorners()
        enterTotalAmountForMonthtextField.applyRoundedCorners()
        enterTotalAmountForYearTextField.applyRoundedCorners()
        monthPickerViewResultLabel.applyRoundedCorners()
        yearPickerResultsLabel.applyRoundedCorners()
        
        topLabel.isHidden = true
        bottomLabel.isHidden = true
        monthPickerViewResultLabel.isHidden = true
        yearPickerResultsLabel.isHidden = true
        
        totalForMonthPicker.delegate = self
        totalForMonthPicker.dataSource = self
        totalForYearPicker.delegate = self
        totalForYearPicker.dataSource = self
        
        createDatePicker()
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        managedObjectContext = appDelegate.persistentContainer.viewContext
        
        if totalExpensesEntry != nil  {
            title = "Edit"
            tapToEnterDateTextField.text = totalExpensesEntry.weekEndingDate
            enterAmountForWeekTextField.text = totalExpensesEntry.totalAmountForWeek
            monthPickerViewResultLabel.text = totalExpensesEntry.month
            enterTotalAmountForMonthtextField.text = totalExpensesEntry.totalAmountForMonth
            yearPickerResultsLabel.text = totalExpensesEntry.year
            enterTotalAmountForYearTextField.text = totalExpensesEntry.totalAmountForYear
        }  else  {
            title = "Compose"
        }
    }
    
    @IBAction func saveButtonTapped(_ sender: Any) {
        if enterAmountForWeekTextField.text == "" && tapToEnterDateTextField.text == "" && enterTotalAmountForMonthtextField.text == "" && enterTotalAmountForYearTextField.text == ""  {
            Alert.TotalExpensesFieldsErrorAlert(on: self)
        } else if tapToEnterDateTextField.text != "" && enterAmountForWeekTextField.text == "" && enterTotalAmountForMonthtextField.text == "" && enterTotalAmountForYearTextField.text == "" {
            Alert.ExpensesSaveErrorAlert(on: self)
        } else if enterAmountForWeekTextField.text != "" && tapToEnterDateTextField.text == "" && enterTotalAmountForMonthtextField.text == "" && enterTotalAmountForYearTextField.text
            == "" {
            Alert.TotalExpensesFieldsErrorAlert(on: self)
        } else if totalExpensesEntry != nil {
            Alert.SavedAlert(on: self)
            self.updateEntry()
            self.navigationController?.popViewController(animated: true)
        } else if tapToEnterDateTextField.text != "" && enterAmountForWeekTextField.text != "" && enterTotalAmountForMonthtextField.text == "" && enterTotalAmountForYearTextField.text == "" {
            Alert.SavedAlert(on: self)
            self.createNewTotalExpensesEntry()
            self.navigationController?.popViewController(animated: true)
        }
        
        if monthPickerViewResultLabel.text != "" && enterTotalAmountForMonthtextField.text == "" {
            Alert.TotalExpensesFieldsErrorAlert(on: self)
        } else if monthPickerViewResultLabel.text == "" && enterTotalAmountForMonthtextField.text != "" {
            Alert.TotalExpensesFieldsErrorAlert(on: self)
        } else if totalExpensesEntry != nil {
            Alert.SavedAlert(on: self)
            self.updateEntry()
            self.navigationController?.popViewController(animated: true)
        } else if monthPickerViewResultLabel.text != "" && enterTotalAmountForMonthtextField.text != "" && tapToEnterDateTextField.text == "" && enterAmountForWeekTextField.text == "" && enterTotalAmountForYearTextField.text == "" {
            Alert.SavedAlert(on: self)
            self.createNewTotalExpensesEntry()
            self.navigationController?.popViewController(animated: true)
        }
        
        if yearPickerResultsLabel.text != "" && enterTotalAmountForYearTextField.text == "" {
            Alert.TotalExpensesFieldsErrorAlert(on: self)
        } else if yearPickerResultsLabel.text == "" && enterTotalAmountForYearTextField.text != "" {
            Alert.TotalExpensesFieldsErrorAlert(on: self)
        } else if totalExpensesEntry != nil {
            Alert.SavedAlert(on: self)
            self.updateEntry()
            self.navigationController?.popViewController(animated: true)
        } else if yearPickerResultsLabel.text != "" && enterTotalAmountForYearTextField.text != "" && tapToEnterDateTextField.text == "" && enterAmountForWeekTextField.text == "" && enterTotalAmountForMonthtextField.text == "" {
            Alert.SavedAlert(on: self)
            self.createNewTotalExpensesEntry()
            self.navigationController?.popViewController(animated: true)
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if totalExpensesEntry == nil  {
            func createMethodAlert()  {
                let alert = UIAlertController(title: "Which Method Do You Want To Add This Total Expense By?", message: nil, preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Add A Week Entry", style: .default, handler: { action in
                    self.totalForWeekEndingLabel.alpha = 1
                    self.tapToEnterDateTextField.isEnabled = true
                    self.tapToEnterDateTextField.alpha = 1
                    self.enterAmountForWeekTextField.isEnabled = true
                    self.enterAmountForWeekTextField.alpha = 1
                    
                    self.totalForMonthOfLabel.alpha = 0.3
                    self.totalForMonthPicker.isUserInteractionEnabled = false
                    self.totalForMonthPicker.alpha = 0.3
                    self.enterTotalAmountForMonthtextField.alpha = 0.3
                    self.enterTotalAmountForMonthtextField.isEnabled = false
                    self.monthPickerViewResultLabel.alpha = 0.3
                    
                    self.totalExpensesForTheYearLabel.alpha = 0.3
                    self.enterTotalAmountForYearTextField.alpha = 0.3
                    self.totalForYearPicker.isUserInteractionEnabled = false
                    self.totalForYearPicker.alpha = 0.3
                    self.enterTotalAmountForYearTextField.isEnabled = false
                    self.enterTotalAmountForYearTextField.alpha = 0.3
                    
                    self.emailButton.isEnabled = true
                    self.emailButton.alpha = 1
                }))
                alert.addAction(UIAlertAction(title: "Add A Month Entry", style: .default, handler: { action in
                    self.totalForWeekEndingLabel.alpha = 0.3
                    self.tapToEnterDateTextField.isEnabled = false
                    self.tapToEnterDateTextField.alpha = 0.3
                    self.enterAmountForWeekTextField.isEnabled = false
                    self.enterAmountForWeekTextField.alpha = 0.3
                    
                    self.totalForMonthOfLabel.alpha = 1
                    self.totalForMonthPicker.isUserInteractionEnabled = true
                    self.totalForMonthPicker.alpha = 1
                    self.enterTotalAmountForMonthtextField.alpha = 1
                    self.enterTotalAmountForMonthtextField.isEnabled = true
                    self.monthPickerViewResultLabel.alpha = 1
                    
                    self.totalExpensesForTheYearLabel.alpha = 0.3
                    self.enterTotalAmountForYearTextField.alpha = 0.3
                    self.totalForYearPicker.isUserInteractionEnabled = false
                    self.totalForYearPicker.alpha = 0.3
                    self.enterTotalAmountForYearTextField.isEnabled = false
                    self.enterTotalAmountForYearTextField.alpha = 0.3
                    
                    self.emailButton.isEnabled = true
                    self.emailButton.alpha = 1
                }))
                alert.addAction(UIAlertAction(title: "Add A Year Entry", style: .default, handler: { action in
                    self.totalForWeekEndingLabel.alpha = 0.3
                    self.tapToEnterDateTextField.isEnabled = false
                    self.tapToEnterDateTextField.alpha = 0.3
                    self.enterAmountForWeekTextField.isEnabled = false
                    self.enterAmountForWeekTextField.alpha = 0.3
                    
                    self.totalForMonthOfLabel.alpha = 0.3
                    self.totalForMonthPicker.isUserInteractionEnabled = false
                    self.totalForMonthPicker.alpha = 0.3
                    self.enterTotalAmountForMonthtextField.alpha = 0.3
                    self.enterTotalAmountForMonthtextField.isEnabled = false
                    self.monthPickerViewResultLabel.alpha = 0.3
                    
                    self.totalExpensesForTheYearLabel.alpha = 1
                    self.totalForYearPicker.isUserInteractionEnabled = true
                    self.totalForYearPicker.alpha = 1
                    self.yearPickerResultsLabel.alpha = 1
                    self.enterTotalAmountForYearTextField.isEnabled = true
                    self.enterTotalAmountForYearTextField.alpha = 1
                    
                    self.emailButton.isEnabled = true
                    self.emailButton.alpha = 1
                }))
                
                alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { action in
                    self.dismiss(animated: true, completion: nil)
                }))
                self.present(alert, animated: true)
            }
            createMethodAlert()
        }
        if monthPickerViewResultLabel.text == "January" {
            setLabels()
            totalForMonthPicker.selectRow(1, inComponent: 0, animated: true)
        } else if monthPickerViewResultLabel.text == "February" {
            setLabels()
            totalForMonthPicker.selectRow(2, inComponent: 0, animated: true)
        } else if monthPickerViewResultLabel.text == "March" {
            setLabels()
            totalForMonthPicker.selectRow(3, inComponent: 0, animated: true)
        } else if monthPickerViewResultLabel.text == "April" {
            setLabels()
            totalForMonthPicker.selectRow(4, inComponent: 0, animated: true)
        } else if monthPickerViewResultLabel.text == "May" {
            setLabels()
            totalForMonthPicker.selectRow(5, inComponent: 0, animated: true)
        } else if monthPickerViewResultLabel.text == "June" {
            setLabels()
            totalForMonthPicker.selectRow(6, inComponent: 0, animated: true)
        } else if monthPickerViewResultLabel.text == "July" {
            setLabels()
            totalForMonthPicker.selectRow(7, inComponent: 0, animated: true)
        } else if monthPickerViewResultLabel.text == "August" {
            setLabels()
            totalForMonthPicker.selectRow(8, inComponent: 0, animated: true)
        } else if monthPickerViewResultLabel.text == "September" {
            setLabels()
            totalForMonthPicker.selectRow(9, inComponent: 0, animated: true)
        } else if monthPickerViewResultLabel.text == "October" {
            setLabels()
            totalForMonthPicker.selectRow(10, inComponent: 0, animated: true)
        } else if monthPickerViewResultLabel.text == "November" {
            setLabels()
            totalForMonthPicker.selectRow(11, inComponent: 0, animated: true)
        } else if monthPickerViewResultLabel.text == "December" {
            setLabels()
            totalForMonthPicker.selectRow(12, inComponent: 0, animated: true)
        }
        
        if yearPickerResultsLabel.text == "2019" {
            setYearLabels()
            totalForYearPicker.selectRow(1, inComponent: 0, animated: true)
        } else if yearPickerResultsLabel.text == "2020" {
            setYearLabels()
            totalForYearPicker.selectRow(2, inComponent: 0, animated: true)
        } else if yearPickerResultsLabel.text == "2021" {
            setYearLabels()
            totalForYearPicker.selectRow(3, inComponent: 0, animated: true)
        } else if yearPickerResultsLabel.text == "2022" {
            setYearLabels()
            totalForYearPicker.selectRow(4, inComponent: 0, animated: true)
        } else if yearPickerResultsLabel.text == "2023" {
            setYearLabels()
            totalForYearPicker.selectRow(5, inComponent: 0, animated: true)
        } else if yearPickerResultsLabel.text == "2024" {
            setYearLabels()
            totalForYearPicker.selectRow(6, inComponent: 0, animated: true)
        } else if yearPickerResultsLabel.text == "2025" {
            setYearLabels()
            totalForYearPicker.selectRow(7, inComponent: 0, animated: true)
        } else if yearPickerResultsLabel.text == "2026" {
            setYearLabels()
            totalForYearPicker.selectRow(8, inComponent: 0, animated: true)
        } else if yearPickerResultsLabel.text == "2027" {
            setYearLabels()
            totalForYearPicker.selectRow(9, inComponent: 0, animated: true)
        } else if yearPickerResultsLabel.text == "2028" {
            setYearLabels()
            totalForYearPicker.selectRow(10, inComponent: 0, animated: true)
        } else if yearPickerResultsLabel.text == "2029" {
            setYearLabels()
            totalForYearPicker.selectRow(11, inComponent: 0, animated: true)
        } else if yearPickerResultsLabel.text == "2030" {
            setYearLabels()
            totalForYearPicker.selectRow(12, inComponent: 0, animated: true)
        }
        
        if monthPickerViewResultLabel.text == "Please Select"{
            monthPickerViewResultLabel.backgroundColor = UIColor.clear
        }
        if yearPickerResultsLabel.text == "Please Select" {
            yearPickerResultsLabel.backgroundColor = UIColor.clear
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if  enterAmountForWeekTextField.text != "" || tapToEnterDateTextField.text != ""  {
            self.totalForMonthOfLabel.alpha = 0.3
            self.totalForMonthPicker.isUserInteractionEnabled = false
            self.totalForMonthPicker.alpha = 0.3
            self.enterTotalAmountForMonthtextField.alpha = 0.3
            self.enterTotalAmountForMonthtextField.isEnabled = false
            self.monthPickerViewResultLabel.alpha = 0.3
            
            self.totalExpensesForTheYearLabel.alpha = 0.3
            self.enterTotalAmountForYearTextField.alpha = 0.3
            self.totalForYearPicker.isUserInteractionEnabled = false
            self.totalForYearPicker.alpha = 0.3
            self.enterTotalAmountForYearTextField.isEnabled = false
            self.enterTotalAmountForYearTextField.alpha = 0.3
        } else if monthPickerViewResultLabel.backgroundColor == UIColor.green || enterTotalAmountForMonthtextField.text != ""  {
            self.totalForWeekEndingLabel.alpha = 0.3
            self.tapToEnterDateTextField.isEnabled = false
            self.tapToEnterDateTextField.alpha = 0.3
            self.enterAmountForWeekTextField.isEnabled = false
            self.enterAmountForWeekTextField.alpha = 0.3
            
            self.totalExpensesForTheYearLabel.alpha = 0.3
            self.enterTotalAmountForYearTextField.alpha = 0.3
            self.totalForYearPicker.isUserInteractionEnabled = false
            self.totalForYearPicker.alpha = 0.3
            self.enterTotalAmountForYearTextField.isEnabled = false
            self.enterTotalAmountForYearTextField.alpha = 0.3
        }  else if yearPickerResultsLabel.backgroundColor == UIColor.green || enterTotalAmountForYearTextField.text != ""  {
            self.totalForWeekEndingLabel.alpha = 0.3
            self.tapToEnterDateTextField.isEnabled = false
            self.tapToEnterDateTextField.alpha = 0.3
            self.enterAmountForWeekTextField.isEnabled = false
            self.enterAmountForWeekTextField.alpha = 0.3
            
            
            self.totalForMonthOfLabel.alpha = 0.3
            self.totalForMonthPicker.isUserInteractionEnabled = false
            self.totalForMonthPicker.alpha = 0.3
            self.enterTotalAmountForMonthtextField.alpha = 0.3
            self.enterTotalAmountForMonthtextField.isEnabled = false
            self.monthPickerViewResultLabel.alpha = 0.3
        }
    }
    
    func hideFields()  {
        totalForWeekEndingLabel.alpha = 0.3
        tapToEnterDateTextField.isEnabled = false
        tapToEnterDateTextField.alpha = 0.3
        enterAmountForWeekTextField.isEnabled = false
        enterAmountForWeekTextField.alpha = 0.3
        
        totalForMonthOfLabel.alpha = 0.3
        totalForMonthPicker.isUserInteractionEnabled = false
        totalForMonthPicker.alpha = 0.3
        monthPickerViewResultLabel.alpha = 0
        enterTotalAmountForMonthtextField.isEnabled = false
        enterTotalAmountForMonthtextField.alpha = 0.3
        
        totalExpensesForTheYearLabel.alpha = 0.3
        totalForYearPicker.isUserInteractionEnabled = false
        totalForYearPicker.alpha = 0.3
        yearPickerResultsLabel.alpha = 0
        enterTotalAmountForYearTextField.isEnabled = false
        enterTotalAmountForYearTextField.alpha = 0.3
        emailButton.isEnabled = false
        emailButton.alpha = 0.3
    }
    
    func setLabels() {
        monthPickerViewResultLabel.backgroundColor = UIColor.green
        monthPickerViewResultLabel.isHidden = false
        monthPickerViewResultLabel.textColor = UIColor.black
    }
    
    func setYearLabels() {
        yearPickerResultsLabel.backgroundColor = UIColor.green
        yearPickerResultsLabel.isHidden = false
        yearPickerResultsLabel.textColor = UIColor.black
    }
    
    func createNewTotalExpensesEntry()  {
        let totalExpensesEntryEntity = NSEntityDescription.entity(forEntityName: "TotalExpenses", in: managedObjectContext)!
        let newTotalExpensesEntry = TotalExpenses(entity: totalExpensesEntryEntity, insertInto: managedObjectContext)
    
        newTotalExpensesEntry.weekEndingDate = self.tapToEnterDateTextField.text
        newTotalExpensesEntry.totalAmountForWeek = self.enterAmountForWeekTextField.text
        newTotalExpensesEntry.month = self.monthPickerViewResultLabel.text
        newTotalExpensesEntry.totalAmountForMonth = self.enterTotalAmountForMonthtextField.text
        newTotalExpensesEntry.year = self.yearPickerResultsLabel.text
        newTotalExpensesEntry.totalAmountForYear = self.enterTotalAmountForYearTextField.text
        
        do  {
            try managedObjectContext.save()
        } catch let error as NSError  {
            print("Could Not Save The New Entry \(error.localizedDescription)")
        }
    }

    func updateEntry()  {
        totalExpensesEntry.weekEndingDate = self.tapToEnterDateTextField.text
        totalExpensesEntry.totalAmountForWeek = self.enterAmountForWeekTextField.text
        totalExpensesEntry.month = self.monthPickerViewResultLabel.text
        totalExpensesEntry.totalAmountForMonth = self.enterTotalAmountForMonthtextField.text
        totalExpensesEntry.year = self.yearPickerResultsLabel.text
        totalExpensesEntry.totalAmountForYear = self.enterTotalAmountForYearTextField.text
        
        do  {
            try managedObjectContext.save()
        } catch let error as NSError  {
            print("Could Not Save The New Entry \(error.localizedDescription)")
        }
    }
    
// Start Of Picker Code
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if (pickerView.tag == 1){
            return months.count
        } else {
            return years.count
        }
    }
    
// Chooses what happens whether the pupil has paid or not - what backgrounds are and what picker is enabled etc.
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String?  {
        if (pickerView.tag == 1)  {
            return "\(months[row])"
        }  else  {
             return  "\(years[row])"
        }
    }
    
// Chooses what happens whether the pupil has paid or not - what backgrounds are and what picker is enabled etc.
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int)  {
        
        if (pickerView.tag == 1)  {
            monthPickerViewResultLabel.isHidden = false
            monthPickerViewResultLabel.text = months[row]
            monthPickerViewResultLabel.backgroundColor = UIColor.green
            monthPickerViewResultLabel.textColor = UIColor.black
        }  else if (pickerView.tag == 2)  {
            yearPickerResultsLabel.isHidden = false
            yearPickerResultsLabel.text = years[row]
            yearPickerResultsLabel.backgroundColor = UIColor.green
            yearPickerResultsLabel.textColor = UIColor.black
        }
    }
// End of Picker Code
    
    func createDatePicker()  {
        
        if #available(iOS 13.4, *) {
            datePicker.preferredDatePickerStyle = .wheels
        }
       
        let dateToolbar = UIToolbar()
        dateToolbar.sizeToFit()
        
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(datePickerViewDoneButtonPressed))
        dateToolbar.setItems([doneButton], animated: true)
        
        tapToEnterDateTextField.inputAccessoryView = dateToolbar
        tapToEnterDateTextField.inputView = datePicker
        
        datePicker.datePickerMode = .date
    }
    
    @objc func  datePickerViewDoneButtonPressed()  {
        let formatter = DateFormatter()
        formatter.dateStyle = .full
        formatter.timeStyle = .none
        let dateString = formatter.string(from: datePicker.date)
        
        tapToEnterDateTextField.text = "\(dateString)"
        self.view.endEditing(true)
    }
    
    @IBAction func emailButtonTapped(_ sender: Any) {
        if MFMailComposeViewController.canSendMail() {
            if  emailTextField.text == ""  {
                let alert = UIAlertController(title: "Alert", message: "Please Fill In Your Email Address In The Field Above.", preferredStyle: UIAlertController.Style.alert)
                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                self.present(alert, animated: true, completion: nil)
            }
            
            let toRecipients = [emailTextField.text]
            
            let date = Date()
            let calendar = NSCalendar.current
            let year = calendar.component(.year, from: date)
            let month = calendar.component(.month, from: date)
            let day = calendar.component(.day, from: date)
            
            let mc: MFMailComposeViewController = MFMailComposeViewController()
            
            mc.mailComposeDelegate = self
            
            mc.setToRecipients(toRecipients as? [String])
            mc.setSubject("Expenses Invoice On \(day)/\(month), \(year)")
            
            mc.setMessageBody("Here Is Your Expenses Grouped Invoice. Note That Depending On Which Option you Selected, Some Fields Will Be Blank.\nPlease Keep For Your Records.\n\nWeek Ending:\n\(tapToEnterDateTextField.text!)\n£\(enterAmountForWeekTextField.text!)\n\nFor The Month Of:\n\(monthPickerViewResultLabel.text!), \(year)\n£\(enterTotalAmountForMonthtextField.text!)\n\nTotal Entry For The Year:\n\(yearPickerResultsLabel.text!)\n£\(enterTotalAmountForYearTextField.text!)", isHTML: false)
            
            self.present(mc, animated: true, completion: nil)
            emailTextField.text = ""
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
}

