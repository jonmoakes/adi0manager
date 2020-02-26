//
//  ExpensesViewController.swift
//  ADI App
//
//  Created by Jonathan Oakes on 27/06/2018.
//  Copyright © 2018 Jonathan Oakes. All rights reserved.
//

import UIKit
import CoreData
import MessageUI

class ExpensesViewController: UIViewController, MFMailComposeViewControllerDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    var managedObjectContext: NSManagedObjectContext!
    var expensesEntry : ExpensesEntries!
    
    @IBOutlet weak var topLabel: UILabel!
    @IBOutlet weak var bottomLabel: UILabel!
    @IBOutlet weak var dateTextField: UITextField!
    @IBOutlet weak var receiptDescriptionTextField: UITextField!
    @IBOutlet weak var receiptAmountTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var receiptImageView: UIImageView!
    
    
    let datePicker = UIDatePicker()
    var imagePicker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dateTextField.applyRoundedCorners()
        receiptDescriptionTextField.applyRoundedCorners()
        receiptAmountTextField.applyRoundedCorners()

        topLabel.isHidden = true
        bottomLabel.isHidden = true
        receiptImageView.isUserInteractionEnabled = true
        createDatePicker()
        imagePicker.delegate = self
        
        let pinchGesture = UIPinchGestureRecognizer(target: self, action: #selector(self.pinchGesture))
        receiptImageView.addGestureRecognizer(pinchGesture)
        
        let rotationGesture = UIRotationGestureRecognizer(target: self, action:#selector(self.rotationGesture))
        receiptImageView.addGestureRecognizer(rotationGesture)
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        managedObjectContext = appDelegate.persistentContainer.viewContext
    
        if expensesEntry != nil  {
        title = "Edit"
            dateTextField.text = expensesEntry.date
            receiptDescriptionTextField.text = expensesEntry.receiptDescription
            receiptAmountTextField.text = expensesEntry.receiptAmount
            if let imageData = expensesEntry.image {
                receiptImageView?.image = UIImage(data: imageData)
            }
        }  else  {
        title = "Compose"
        }
    }

    @objc func pinchGesture(sender:UIPinchGestureRecognizer) {
        sender.view?.transform = (sender.view?.transform.scaledBy(x: sender.scale, y: sender.scale))!
        sender.scale = 1.0
    }
    
    @objc func rotationGesture(sender:UIRotationGestureRecognizer) {
        sender.view?.transform = (sender.view?.transform)!.rotated(by: sender.rotation)
        sender.rotation = 0
    }
    
    @IBAction func photosTapped(_ sender: Any) {
        imagePicker.sourceType = .photoLibrary
        present(imagePicker, animated: true, completion: nil)
    }
    
    @IBAction func cameraTapped(_ sender: Any) {
        imagePicker.sourceType = .camera
        present(imagePicker, animated: true, completion: nil)
    }
    
    @IBAction func infoButtonTapped(_ sender: Any) {
        Alert.ExpensesImageInfoButtonTappedAlert(on: self)
    }
    
    @IBAction func emailInfoTapped(_ sender: Any) {
        Alert.ExpensesEmailInfoButtonTappedAlert(on: self)
    }
    
    @IBAction func saveButtonTapped(_ sender: Any) {
        if dateTextField.text == "" || receiptDescriptionTextField.text == "" || receiptAmountTextField.text == ""  {
            Alert.ExpensesSaveErrorAlert(on: self)
        } else if expensesEntry != nil  {
            Alert.SavedAlert(on: self)
            self.updateEntry()
            self.navigationController?.popToRootViewController(animated: true)
        } else  {
            if dateTextField.text != "" && receiptDescriptionTextField.text != "" && receiptAmountTextField.text != ""  {
                Alert.SavedAlert(on: self)
                self.createNewExpensesEntry()
                self.navigationController?.popToRootViewController(animated: true)
            }
        }
    }
    
// correcting image orientation
    func fixOrientation(img: UIImage) -> UIImage {
        if (img.imageOrientation == .up) {
            return img
        }
        
        UIGraphicsBeginImageContextWithOptions(img.size, false, img.scale)
        let rect = CGRect(x: 0, y: 0, width: img.size.width, height: img.size.height)
        img.draw(in: rect)
        
        let normalizedImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        
        return normalizedImage
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let chosenImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            receiptImageView.image  = self.fixOrientation(img: chosenImage)
        }
        imagePicker.dismiss(animated: true, completion: nil)
    }
    

    func createNewExpensesEntry()  {
        let expensesEntryEntity = NSEntityDescription.entity(forEntityName: "ExpensesEntries", in: managedObjectContext)!
        let newExpensesEntry = ExpensesEntries(entity: expensesEntryEntity, insertInto: managedObjectContext)
        
        newExpensesEntry.date = self.dateTextField.text
        newExpensesEntry.receiptDescription = self.receiptDescriptionTextField.text
        newExpensesEntry.receiptAmount = self.receiptAmountTextField.text
        
        // convert image to data
        if let image = receiptImageView.image {
            if let imageData = image.pngData() {
                newExpensesEntry.image = imageData // ? was there before.
                newExpensesEntry.image = imageData
            }
        }
        
        do  {
            try managedObjectContext.save()
        } catch let error as NSError  {
            print("Could Not Save The New Entry \(error.localizedDescription)")
        }
    }
    
    func updateEntry()  {
        expensesEntry.date = self.dateTextField.text
        expensesEntry.receiptDescription = self.receiptDescriptionTextField.text
        expensesEntry.receiptAmount = self.receiptAmountTextField.text
        if let imageInsert = receiptImageView.image {
            if let imageDataInsert = imageInsert.pngData() {
                expensesEntry.image = imageDataInsert
            }
        }
        do  {
            try managedObjectContext.save()
        } catch let error as NSError  {
            print("Could Not Save The New Entry \(error.localizedDescription)")
        }
    }
    
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
    
    @IBAction func emailButtonPressed(_ sender: Any) {
        if MFMailComposeViewController.canSendMail() {
            if  emailTextField.text == "" || dateTextField.text == "" || receiptDescriptionTextField.text == "" || receiptAmountTextField.text == "" {
                let alert = UIAlertController(title: "Alert", message: "Please Fill In All Three Fields Above And Then Tap Save.\nThen, Come Back To This Page, Enter In Your Email Address And Then Tap The Envelope Button.", preferredStyle: UIAlertController.Style.alert)
                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                self.present(alert, animated: true, completion: nil)
            }
            
            let toRecipients = [emailTextField.text]
            
            let mc: MFMailComposeViewController = MFMailComposeViewController()
            
            //Add Image as Attachment
            if let image = receiptImageView.image {
                let data = image.pngData()
                mc.addAttachmentData(data!, mimeType: "image/png", fileName: "image")
            }
            
            mc.mailComposeDelegate = self
            
            mc.setToRecipients(toRecipients as? [String])
            mc.setSubject("Expenses Invoice On \(dateTextField.text!)\n ( Format Is Month Then Date )")
            
            mc.setMessageBody("Here Is Your Expenses Invoice For Your Records.\n\nDate:\n\(dateTextField.text!) ( Format Is Month Then Date )\n\nReceipt Description:\n\(receiptDescriptionTextField.text!)\n\nReceipt Amount:\n£\(receiptAmountTextField.text!)\n\nReceipt Image:", isHTML: false)
            
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

