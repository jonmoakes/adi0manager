//
//  Alert.swift
//  ADI App
//
//  Created by Jonathan Oakes on 02/03/2019.
//  Copyright © 2019 Jonathan Oakes. All rights reserved.
//

import Foundation
import UIKit

struct Alert {
    
    private static func showBasicAlert(on vc: UIViewController, with title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        DispatchQueue.main.async { vc.present(alert, animated: true) }
    }
    
    // Email Alerts
    static func showEmailCancelledMessage(on vc: UIViewController) {
        showBasicAlert(on: vc, with: "Message Cancelled.", message: "Your Email Was Not Sent.")
    }
    
    static func showEmailSavedMessage(on vc: UIViewController) {
        showBasicAlert(on: vc, with: "Draft Saved", message: "Your Message Was Saved To Your Draft Folder And Has Not Been Sent Yet.\n\nAccess The Drafts Tab In Your Apple Email App To Send The Message When You're Ready.")
    }
    
    static func showEmailFailedMessage(on vc: UIViewController) {
        showBasicAlert(on: vc, with: "Email Saved", message: "Sorry, Your Message Did Not Send. Please Check Your Email Settings And Then Try Again.")
    }
    
    static func showEmailSentMessage(on vc: UIViewController) {
        showBasicAlert(on: vc, with: "Thank You!", message: "Your Message Has Been Sent!")
    }
    
    static func showSuccessEmailSentMessage(on vc: UIViewController) {
        showBasicAlert(on: vc, with: "Success!", message: "Your Message Has Been Sent!")
    }
    
    
    static func showNoEmailAccountFoundError(on vc: UIViewController) {
        showBasicAlert(on: vc, with: "Error", message: "No Mail Account Detected. Please Make Sure The Apple Mail App Is Set Up In The 'Settings' App On Your Device.")
    }
    
    //Journal Alerts
    static func showDiaryInfoWhenInfoButtonPressedAlert(on vc: UIViewController) {
        showBasicAlert(on: vc, with: "Information", message: "Tap The Date Text Field And Then Choose Your Date. Then Tap Anywhere In The White Box And Simply Start Writing Your Days Diary In Whatever Format You Use. The Text View Gives Infinite Space - You Are Not Limited By The Size Of The Box :)")
    }
    
    static func showDiaryEntryErrorAlert(on vc: UIViewController) {
        showBasicAlert(on: vc, with: "Error", message: "Please Enter At Least The Date In Order To Create An Entry")
    }
    
    // Add Lesson Page Alerts
    static func LessonEmailInfoButtonTappedAlert(on vc: UIViewController) {
        showBasicAlert(on: vc, with: "Information", message: "You Can Send The Pupil Or Yourself An Email Containing The Data On This Form.\n\nDon't Forget To Tap The 'SAVE' Button At The Top Right To Save The Info First.\n\nThen, Come Back To This Page, Enter In Either Your Or The Pupil's Email Address In The Field Below And Then Tap The Envelope Button.")
    }
    
    static func LessonBlockBookingInfoButtonTappedAlert(on vc: UIViewController) {
        showBasicAlert(on: vc, with: "Information", message: "Once You've Saved The Info On This Page, Go To The Home Screen, Then The 'Pupils' Tab, Then Tap On The Pupil's Name And Choose 'Block Bookings.'\n\nThere, You'll Find A Form To Keep Track Of The Amount Of Time Remaining On Their Block That You Can Update After Each Lesson.")
    }
    
    static func LessonFieldsErrorAlert(on vc: UIViewController) {
        showBasicAlert(on: vc, with: "Error", message: "Please Enter The Pupils Name And Date Fields As A Minimum, In Order To Be Able To Create And Save An Entry.\nThis Will Allow For Easy Searching On The Table List.\n\nOr Press The 'Back' Button In The Top Left To Go Back To The Pupil Lesson Entries List WITHOUT Saving Any Data.\n\nIf The 'Driving Test?' Switch Is OFF, The Table Will Default To Showing Empty Start And End Times For A Lesson.\n\n If The Switch Is ON, Please Make Sure You Have Filled In The 'Start Time' And 'Location' Fields Too - This Will Make The Table Display The Fact That This Entry Is A Driving Test, In Addition To The Pupil Name, Date, Test Start Time And Test Location.\n You Can Add Info To The Result Section When The Test Is Finished.")
    }
    
    //Expenses Alerts
    static func ExpensesImageInfoButtonTappedAlert(on vc: UIViewController) {
        showBasicAlert(on: vc, with: "Information", message: "Whilst Adding An Image Is Not Mandatory, If You Wish To Do So, Simply Tap On Either The Folder Icon Or Camera Icon In The Top Right Of The Screen To Access The Photo Library Or Camera Resepectively.\nChoose Or Take The Photo Required And Then Your Chosen Image Will Appear In The Display.\n\nDon't Forget To Tap The Save Button To Save The Entry!\n\nYou Can Use The Rotation And / Or Zoom Gesture Using Two Fingertips To Rotate Or Zoom The Image As Desired :) Note That If You Edit The Image With The Zoom Or Rotation Gestures And Press Save, The Image Will Remain As It Was When Originally Saved.")
    }
    
    static func ExpensesEmailInfoButtonTappedAlert(on vc: UIViewController) {
        showBasicAlert(on: vc, with: "Information", message: "Fill In All The Required Fields And Then Tap The 'Save' Button. Then, Come Back To This Entry, Fill In The Email Address Field And Then Tap The Envelope Button.\n\nWhen Prompted To Choose A Size For The Attachment, Please Choose 'Actual Size' In Order For The Request To Be Successful. Actual Size Is Quite A Large File So Please Be Patient Whilst It Sends - It Will Take A Good Few Minutes But Your Apple Mail App Will Send It In The Background Whilst You Carry On :) \nMake Sure You Have The Apple Email Enabled And Set Up On Your Device Before Attempting To Send.")
    }
    
    static func ExpensesSaveErrorAlert(on vc: UIViewController) {
        showBasicAlert(on: vc, with: "Error", message: "Please Enter All Of The Fields Marked With '*' In Order To Be Able To Create And Save An Entry. Adding An Image Is Optional.\nThis Will Allow For Easy Searching On The Table List.\n\nOr Press The 'Back' Button In The Top Left To Go Back To The Expenses Entries List WITHOUT Saving Any Data.")
    }
    
    static func TotalExpensesFieldsErrorAlert(on vc: UIViewController) {
        showBasicAlert(on: vc, with: "Error", message: " Please Fill In The Fields Required.\n\nThese Are The 'Tap To Enter The Date' And 'Enter The Total Amount For The Week' Fields If You Chose The 'Weekly' Option When The Screen Laoded.\n\nIf You Chose The 'Monthly' Option, You Need To Select The Month From The Month Picker And Then Fill In The 'Enter The Total Amount For The Month' Field.\n\nIf You Selected The Yearly Option, You Need To Select The Required Year From The Year Picker And Then Fill In The 'Enter The Total Amount For The Year' Field.")
    }
    
    
    //Pupil Alerts
    static func pupilFieldsAlert(on vc: UIViewController) {
        showBasicAlert(on: vc, with: "Error", message: "Please Enter The Pupils Name As A Minimum In Order To Be Able To Create And Save An Entry.\n\nOr Press The 'Back' Button In The Top Left To Go Back To The Pupil Entries List WITHOUT Saving Any Data.")
    }
    
    static func pupilCallInfoAlert(on vc: UIViewController) {
        showBasicAlert(on: vc, with: "Information", message: "Call / Text Using The Buttons At The Top Of Screen.\n\nIf You Only List One Phone Number, Make Sure It Is Entered In the 'PRIMARY' Phone Number Field.\n\nNOTE:\nWhen Adding Or Editing Numbers, Don't Forget To Press The Save Button First.\n\nWhen You Come Back To This Screen, The Call And Message Buttons Will Be Enabled ( Message Only On iPad ).")
    }
    
    static func pupilCallErrorAlert(on vc: UIViewController) {
        showBasicAlert(on: vc, with: "Information", message: "No Or Incorrect Phone Number Provided - Please Enter A Valid Phone Number ( No Spaces Between Numbers And 11 Digits ) - Don't Forget To Save The Entry First Before Using The Call Button.")
    }
    
    static func pupilProgressInfoAlert(on vc: UIViewController) {
        showBasicAlert(on: vc, with: "Information", message: "Tap On A Subject Name To Show Details. Tap On The Subject Name Again To Hide The Details.\n\nUse The Slider To Grade The Pupil's Progress In That Subject And Enter Any Other Information About Their Performance You Would Like In the Text Box.\n\nIf The Subject Has Not Been Introduced Or Has Been Graded Level 1, The Subject Label Will Be Coloured Red.\n\nGrades 2 - 4 Will Be Coloured Amber And Grade 5 Will Be Coloured Green.\n\nThs Way, You Can Easily See From The List Which Subjects Pupils Are Yet To Be Introduced To, Need More Work On Or Are Independent In.\n\nIf You Just Want To Grade An Overall Lesson Performance, Tap The 'Latest Lesson Performance' Label.\n\nYou can Email The Pupil The Information You enter By Tapping The 'Email Lesson Report' Button.\n\nIf You Want To Email The Whole Group Of Subjects, Then Tap The Envelope Button At The Top Of The Page.\n\nAfter Each Lesson You Can Come Back And Update Their Grade And Either Overwrite The Information In The Box Or Add To It For A Full Record Of A Pupils Progress In A Subject! You Have Unlimited Space In the Text Box.\n\nDon't Forget To Save By Tapping The Save Button Before You Leave The Screen! :)")
    }
    
    //Block Booking Alerts
    static func blockBookingFieldErrorAlert(on vc: UIViewController) {
        showBasicAlert(on: vc, with: "Error", message: "Please Make Sure At Least One Of The Fields Is Filled In In Order To Save An Entry. ")
    }
    
    static func blockBookingClearedDataAlert(on vc: UIViewController) {
        showBasicAlert(on: vc, with: "Data Cleared!", message: "")
    }
    
    //Save Alert
    static func SavedAlert(on vc: UIViewController) {
        showBasicAlert(on: vc, with: "Saved!", message: "")
    }
    
    // income alert
    static func calculateErrorAlert(on vc: UIViewController) {
        showBasicAlert(on: vc, with: "Error", message: "Please Make Sure All Fields Are Filled In In Order To Save An Entry.")
    }
    
    
    
    
    
    
    
    
    
    
    

}
