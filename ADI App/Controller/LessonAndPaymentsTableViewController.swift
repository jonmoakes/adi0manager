//
//  LessonAndPaymentsTableViewController.swift
//  ADI App
//
//  Created by Jonathan Oakes on 27/06/2018.
//  Copyright © 2018 Jonathan Oakes. All rights reserved.
//

import UIKit
import CoreData

class LessonAndPaymentsTableViewController: UITableViewController {
    
    @IBOutlet weak var searchBar: UISearchBar!
    var managedObjectContext: NSManagedObjectContext!
    var lessonEntries = [LessonEntries]()

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpNavBar()
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        managedObjectContext = appDelegate.persistentContainer.viewContext
        tableView.tableFooterView = UIView(frame: CGRect.zero)
    }
    
    func setUpNavBar()  {
        navigationController?.navigationBar.prefersLargeTitles = true
    }

    override func viewWillAppear(_ animated: Bool) {
        self.fetchEntries()
        // Add a background view to the table view
        let backgroundImage = UIImage(named: "ADI-4")
        let imageView = UIImageView(image: backgroundImage)
        self.tableView.backgroundView = imageView
        imageView.contentMode = .scaleAspectFill
        imageView.alpha = 0.6
    }

    @IBAction func homeButtonTapped(_ sender: Any) {
        self.dismiss(animated: true)
    }
    func fetchEntries()  {
        //let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "LessonEntries") - For Non Sorting
        let fetchRequest = NSFetchRequest<LessonEntries>(entityName: "LessonEntries")
        let dateSort = NSSortDescriptor(key: "date", ascending: false)
        let timeSort = NSSortDescriptor(key: "lessonStartTime", ascending: false)
        
        fetchRequest.sortDescriptors = [dateSort, timeSort]
        
        do  {
            let entryObjects = try managedObjectContext.fetch(fetchRequest)
            self.lessonEntries = entryObjects as [LessonEntries]
        } catch let error as NSError  {
            print("Could Not Fetch Entries \(error.localizedDescription)")
        }
        self.tableView.reloadData()
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return lessonEntries.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LessPayCell", for: indexPath)
        cell.textLabel?.textColor = UIColor.black
        
        let entry = self.lessonEntries[indexPath.row]
        
        if (entry.pupilPaid?.contains("Yes"))!  {
            cell.backgroundColor = UIColor.init(displayP3Red: 0.471, green: 0.980, blue: 0.298, alpha: 0.9)
        } else if (entry.pupilPaid?.contains("No"))!  {
            cell.backgroundColor = UIColor.init(displayP3Red: 0.914, green: 0.200, blue: 0.137, alpha: 0.9)
        } else if entry.testLocation != "" {
            cell.backgroundColor = UIColor.init(displayP3Red: 0.314, green: 0.635, blue: 0.971, alpha: 0.9)
        } else  {
            cell.backgroundColor = UIColor.init(displayP3Red: 0.933, green: 0.525, blue: 0.200, alpha: 0.9)
        }
        
        if (entry.date?.contains("01-"))! && entry.testLocation != "" {
            let jString = entry.date
            let janString = jString!.replacingOccurrences(of: "01-", with: "January ")
            cell.textLabel?.text = "DRIVING TEST\nName: \(entry.pupilName ?? "")\n\(janString)\nTest Start Time: \(entry.lessonStartTime ?? "")\nTest Centre: \(entry.testLocation ?? "")"
        } else if (entry.date?.contains("01-"))! && entry.testLocation == "" {
            let jString = entry.date
            let janString = jString!.replacingOccurrences(of: "01-", with: "January ")
            cell.textLabel?.text = "Name: \(entry.pupilName ?? "")\n\(janString)\nLesson Start Time: \(entry.lessonStartTime ?? "")\nLesson End Time: \(entry.lessonEndTime ?? "")"
        }
        
        if (entry.date?.contains("02-"))! && entry.testLocation != "" {
            let fString = entry.date
            let febString = fString!.replacingOccurrences(of: "02-", with: "February ")
            cell.textLabel?.text = "DRIVING TEST\nName: \(entry.pupilName ?? "")\n\(febString)\nTest Start Time: \(entry.lessonStartTime ?? "")\nTest Centre: \(entry.testLocation ?? "")"
        } else if (entry.date?.contains("02-"))! && entry.testLocation == "" {
            let fString = entry.date
            let febString = fString!.replacingOccurrences(of: "02-", with: "February ")
            cell.textLabel?.text = "Name: \(entry.pupilName ?? "")\n\(febString)\nLesson Start Time: \(entry.lessonStartTime ?? "")\nLesson End Time: \(entry.lessonEndTime ?? "")"
        }
        
        if (entry.date?.contains("03-"))! && entry.testLocation != "" {
            let mString = entry.date
            let marString = mString!.replacingOccurrences(of: "03-", with: "March ")
            cell.textLabel?.text = "DRIVING TEST\nName: \(entry.pupilName ?? "")\n\(marString)\nTest Start Time: \(entry.lessonStartTime ?? "")\nTest Centre: \(entry.testLocation ?? "")"
        } else if (entry.date?.contains("03-"))! && entry.testLocation == "" {
            let mString = entry.date
            let marString = mString!.replacingOccurrences(of: "03-", with: "March ")
            cell.textLabel?.text = "Name: \(entry.pupilName ?? "")\n\(marString)\nLesson Start Time: \(entry.lessonStartTime ?? "")\nLesson End Time: \(entry.lessonEndTime ?? "")"
        }
        
        if (entry.date?.contains("04-"))! && entry.testLocation != "" {
            let apString = entry.date
            let aprString = apString!.replacingOccurrences(of: "04-", with: "April ")
            cell.textLabel?.text = "DRIVING TEST\nName: \(entry.pupilName ?? "")\n\(aprString)\nTest Start Time: \(entry.lessonStartTime ?? "")\nTest Centre: \(entry.testLocation ?? "")"
        } else if (entry.date?.contains("04-"))! && entry.testLocation == "" {
            let apString = entry.date
            let aprString = apString!.replacingOccurrences(of: "04-", with: "April ")
            cell.textLabel?.text = "Name: \(entry.pupilName ?? "")\n\(aprString)\nLesson Start Time: \(entry.lessonStartTime ?? "")\nLesson End Time: \(entry.lessonEndTime ?? "")"
        }
        
        if (entry.date?.contains("05-"))! && entry.testLocation != "" {
            let maString = entry.date
            let mayString = maString!.replacingOccurrences(of: "05-", with: "May ")
            cell.textLabel?.text = "DRIVING TEST\nName: \(entry.pupilName ?? "")\n\(mayString)\nTest Start Time: \(entry.lessonStartTime ?? "")\nTest Centre: \(entry.testLocation ?? "")"
        } else if (entry.date?.contains("05-"))! && entry.testLocation == "" {
            let maString = entry.date
            let mayString = maString!.replacingOccurrences(of: "05-", with: "May ")
            cell.textLabel?.text = "Name: \(entry.pupilName ?? "")\n\(mayString)\nLesson Start Time: \(entry.lessonStartTime ?? "")\nLesson End Time: \(entry.lessonEndTime ?? "")"
        }
        
        if (entry.date?.contains("06-"))! && entry.testLocation != "" {
            let juString = entry.date
            let junString = juString!.replacingOccurrences(of: "06-", with: "June ")
            cell.textLabel?.text = "DRIVING TEST\nName: \(entry.pupilName ?? "")\n\(junString)\nTest Start Time: \(entry.lessonStartTime ?? "")\nTest Centre: \(entry.testLocation ?? "")"
        } else if (entry.date?.contains("06-"))! && entry.testLocation == "" {
            let juString = entry.date
            let junString = juString!.replacingOccurrences(of: "06-", with: "June ")
            cell.textLabel?.text = "Name: \(entry.pupilName ?? "")\n\(junString)\nLesson Start Time: \(entry.lessonStartTime ?? "")\nLesson End Time: \(entry.lessonEndTime ?? "")"
        }
        
        if (entry.date?.contains("07-"))! && entry.testLocation != "" {
            let julString = entry.date
            let julyString = julString!.replacingOccurrences(of: "07-", with: "July ")
            cell.textLabel?.text = "DRIVING TEST\nName: \(entry.pupilName ?? "")\n\(julyString)\nTest Start Time: \(entry.lessonStartTime ?? "")\nTest Centre: \(entry.testLocation ?? "")"
        } else if (entry.date?.contains("07-"))! && entry.testLocation == "" {
            let julString = entry.date
            let julyString = julString!.replacingOccurrences(of: "07-", with: "July ")
            cell.textLabel?.text = "Name: \(entry.pupilName ?? "")\n\(julyString)\nLesson Start Time: \(entry.lessonStartTime ?? "")\nLesson End Time: \(entry.lessonEndTime ?? "")"
        }
        
        if (entry.date?.contains("08-"))! && entry.testLocation != "" {
            let auString = entry.date
            let augString = auString!.replacingOccurrences(of: "08-", with: "August ")
            cell.textLabel?.text = "DRIVING TEST\nName: \(entry.pupilName ?? "")\n\(augString)\nTest Start Time: \(entry.lessonStartTime ?? "")\nTest Centre: \(entry.testLocation ?? "")"
        } else if (entry.date?.contains("08-"))! && entry.testLocation == "" {
            let auString = entry.date
            let augString = auString!.replacingOccurrences(of: "08-", with: "August ")
            cell.textLabel?.text = "Name: \(entry.pupilName ?? "")\n\(augString)\nLesson Start Time: \(entry.lessonStartTime ?? "")\nLesson End Time: \(entry.lessonEndTime ?? "")"
        }
        
        if (entry.date?.contains("09-"))! && entry.testLocation != "" {
            let seString = entry.date
            let sepString = seString!.replacingOccurrences(of: "09-", with: "September ")
            cell.textLabel?.text = "DRIVING TEST\nName: \(entry.pupilName ?? "")\n\(sepString)\nTest Start Time: \(entry.lessonStartTime ?? "")\nTest Centre: \(entry.testLocation ?? "")"
        } else if (entry.date?.contains("09-"))! && entry.testLocation == "" {
            let seString = entry.date
            let sepString = seString!.replacingOccurrences(of: "09-", with: "September ")
            cell.textLabel?.text = "Name: \(entry.pupilName ?? "")\n\(sepString)\nLesson Start Time: \(entry.lessonStartTime ?? "")\nLesson End Time: \(entry.lessonEndTime ?? "")"
        }
        
        if (entry.date?.contains("10-"))! && entry.testLocation != "" {
            let ocString = entry.date
            let octString = ocString!.replacingOccurrences(of: "10-", with: "October ")
            cell.textLabel?.text = "DRIVING TEST\nName: \(entry.pupilName ?? "")\n\(octString)\nTest Start Time: \(entry.lessonStartTime ?? "")\nTest Centre: \(entry.testLocation ?? "")"
        } else if (entry.date?.contains("10-"))! && entry.testLocation == "" {
            let ocString = entry.date
            let octString = ocString!.replacingOccurrences(of: "10-", with: "October ")
            cell.textLabel?.text = "Name: \(entry.pupilName ?? "")\n\(octString)\nLesson Start Time: \(entry.lessonStartTime ?? "")\nLesson End Time: \(entry.lessonEndTime ?? "")"
        }
        
        if (entry.date?.contains("11-"))! && entry.testLocation != "" {
            let noString = entry.date
            let novString = noString!.replacingOccurrences(of: "11-", with: "November ")
            cell.textLabel?.text = "DRIVING TEST\nName: \(entry.pupilName ?? "")\n\(novString)\nTest Start Time: \(entry.lessonStartTime ?? "")\nTest Centre: \(entry.testLocation ?? "")"
        } else if (entry.date?.contains("11-"))! && entry.testLocation == "" {
            let noString = entry.date
            let novString = noString!.replacingOccurrences(of: "11-", with: "November ")
            cell.textLabel?.text = "Name: \(entry.pupilName ?? "")\n\(novString)\nLesson Start Time: \(entry.lessonStartTime ?? "")\nLesson End Time: \(entry.lessonEndTime ?? "")"
        }
        
        if (entry.date?.contains("12-"))! && entry.testLocation != "" {
            let deString = entry.date
            let decString = deString!.replacingOccurrences(of: "12-", with: "December ")
            cell.textLabel?.text = "DRIVING TEST\nName: \(entry.pupilName ?? "")\n\(decString)\nTest Start Time: \(entry.lessonStartTime ?? "")\nTest Centre: \(entry.testLocation ?? "")"
        } else if (entry.date?.contains("12-"))! && entry.testLocation == "" {
            let deString = entry.date
            let decString = deString!.replacingOccurrences(of: "12-", with: "December ")
            cell.textLabel?.text = "Name: \(entry.pupilName ?? "")\n\(decString)\nLesson Start Time: \(entry.lessonStartTime ?? "")\nLesson End Time: \(entry.lessonEndTime ?? "")"
        }
            cell.textLabel?.numberOfLines = 0
            cell.textLabel?.font = UIFont(name: "Futura-CondensedExtraBold", size: 19)
        return cell
    }

    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if(indexPath.row % 2 == 0)  {
            let rotationTransform = CATransform3DTranslate(CATransform3DIdentity, -500, 10, 0)
            cell.layer.transform = rotationTransform
            cell.alpha = 0.3
            
            UIView.animate(withDuration: 0.5) {
                cell.layer.transform = CATransform3DIdentity
                cell.alpha = 1.0
            }
        }   else  {
            let rotationTransform = CATransform3DTranslate(CATransform3DIdentity, 500, 10, 0)
            cell.layer.transform = rotationTransform
            cell.alpha = 0.3
            
            UIView.animate(withDuration: 0.5) {
                cell.layer.transform = CATransform3DIdentity
                cell.alpha = 1.0
            }
        }
                
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let entry = lessonEntries[indexPath.row]
        self.performSegue(withIdentifier: "goFromLessonTableViewToAddLessonVC", sender: entry)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goFromLessonTableViewToAddLessonVC"  {
            let composeVC = segue.destination as! AddLessonViewController
            composeVC.lessonEntry = sender as? LessonEntries
        }
    }

    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete  {
            let entry = self.lessonEntries[indexPath.row]
            
            let deleteAlertController = UIAlertController(title: "Are You Sure?", message: "This Will Delete All Data Entered For This Lesson Forever.", preferredStyle: .alert)
            
            let imSure = UIAlertAction(title: "I'm Sure", style: .destructive) { (action) in
                self.managedObjectContext.delete(entry)
                self.lessonEntries.remove(at: indexPath.row)
                self.tableView.deleteRows(at: [indexPath], with: .automatic)
                
                do  {
                    try self.managedObjectContext.save()
                } catch let error as NSError  {
                    print("Could Not Save The New Entry \(error.localizedDescription)")
                }
            }
            deleteAlertController.addAction(imSure)
            
            let cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
            deleteAlertController.addAction(cancel)
            
            self.present(deleteAlertController, animated: true, completion: nil)
        }
    }
}

extension LessonAndPaymentsTableViewController: UISearchBarDelegate  {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        let request : NSFetchRequest<LessonEntries> = LessonEntries.fetchRequest()
        
        let namePredicate = NSPredicate(format: "pupilName CONTAINS[cd] %@", searchBar.text! )
        let datePredicate = NSPredicate(format: "date CONTAINS[cd] %@", searchBar.text!)
        let paidPredicate = NSPredicate(format: "pupilPaid CONTAINS[cd] %@", searchBar.text!)
        let paymentMethodPredicate = NSPredicate(format: "paymentMethod CONTAINS[cd] %@", searchBar.text!)
        let lessonSummaryPredicate = NSPredicate(format: "lessonSummary CONTAINS[cd] %@", searchBar.text!)
        let startTimePredicate = NSPredicate(format: "lessonStartTime CONTAINS[cd] %@", searchBar.text!)
        let locationPredicate = NSPredicate(format: "testLocation CONTAINS[cd] %@", searchBar.text!)
        
        let combinedPredicate = NSCompoundPredicate(orPredicateWithSubpredicates: [namePredicate, datePredicate, paidPredicate, paymentMethodPredicate, lessonSummaryPredicate, startTimePredicate, locationPredicate])
        
        request.predicate = combinedPredicate
        
        do  {
            lessonEntries = try managedObjectContext.fetch(request)
        } catch {
            print("error \(error)")
        }
        tableView.reloadData()
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchBar.text?.count == 0  {
            fetchEntries()
            DispatchQueue.main.async {
                searchBar.resignFirstResponder()
            }
        }
    }
}

