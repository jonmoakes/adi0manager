//
//  ComposerViewController.swift
//  ADI App
//
//  Created by Jonathan Oakes on 27/06/2018.
//  Copyright © 2018 Jonathan Oakes. All rights reserved.
//

import UIKit
import CoreData

class ComposerViewController: UIViewController, UITextViewDelegate {
    
    var managedObjectContext: NSManagedObjectContext!
    var diaryEntry: DiaryEntry!

    @IBOutlet weak var dateTextField: UITextField!
    @IBOutlet weak var textViewField: UITextView!
    
    let datePicker = UIDatePicker()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dateTextField.applyRoundedCorners()
        textViewField.applyRoundedCorners()

        createDatePicker()
                
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        managedObjectContext = appDelegate.persistentContainer.viewContext
        if diaryEntry != nil  {
            title = "Edit"
            textViewField.text = diaryEntry.bodyText
            dateTextField.text = diaryEntry.date
        }  else  {
            title = "Compose"
           }
    }
    
    @IBAction func infoButtonPressed(_ sender: Any) {
        Alert.showDiaryInfoWhenInfoButtonPressedAlert(on: self)
    }
    
    @IBAction func saveButtonPressed(_ sender: Any) {
        if dateTextField.text == ""  {
            Alert.showDiaryEntryErrorAlert(on: self)
        } else if diaryEntry != nil  {
            Alert.SavedAlert(on: self)
            self.updateEntry()
            self.navigationController?.popToRootViewController(animated: true)
        } else  {
            if dateTextField.text != ""  {
                 Alert.SavedAlert(on: self)
                self.createNewDiaryEntry()
                self.navigationController?.popToRootViewController(animated: true)
            }
        }
    }
    
    func updateEntry()  {
        diaryEntry.date = self.dateTextField.text
        diaryEntry.bodyText = self.textViewField.text
        
        do  {
            try managedObjectContext.save()
        } catch let error as NSError  {
            print("Could Not Save The New Entry \(error.localizedDescription)")
        }
    }
    
    func createNewDiaryEntry()  {
        let diaryEntryEntity = NSEntityDescription.entity(forEntityName: "DiaryEntry", in: managedObjectContext)!
        let newDiaryEntry = DiaryEntry(entity: diaryEntryEntity, insertInto: managedObjectContext)
        
        newDiaryEntry.date = self.dateTextField.text
        newDiaryEntry.bodyText = self.textViewField.text
        
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
        
        // format picker for date only
        datePicker.datePickerMode = .date
    }
    
    @objc func  datePickerViewDoneButtonPressed()  {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy    MM-dd,     EEEE"
        
        let dateString = formatter.string(from: datePicker.date)
        
        dateTextField.text = "\(dateString)"
        self.view.endEditing(true)
    }
    // End of code that creates date picker and toolbar.
}
    
    
    


