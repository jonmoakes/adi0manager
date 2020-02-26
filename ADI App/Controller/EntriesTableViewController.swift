//
//  EntriesTableViewController.swift
//  ADI App
//
//  Created by Jonathan Oakes on 27/06/2018.
//  Copyright © 2018 Jonathan Oakes. All rights reserved.
//

import UIKit
import CoreData

class EntriesTableViewController: UITableViewController {

    var managedObjectContext: NSManagedObjectContext!
    var diaryEntries = [DiaryEntry]()
    
    @IBOutlet var diaryTable: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
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
    
    func fetchEntries()  {
        let fetchRequest = NSFetchRequest<DiaryEntry>(entityName: "DiaryEntry")
        let dateSort = NSSortDescriptor(key: "date", ascending: false)
        fetchRequest.sortDescriptors = [dateSort]
        do  {
            let entryObjects = try managedObjectContext.fetch(fetchRequest)
            self.diaryEntries = entryObjects as [DiaryEntry]
        } catch let error as NSError  {
            print("Could Not Fetch Entries \(error.localizedDescription)")
        }
            self.tableView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goFromDiaryTableViewToComposerVC"  {
            let composeVC = segue.destination as! ComposerViewController
            composeVC.diaryEntry = sender as? DiaryEntry
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return diaryEntries.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "EntryCell", for: indexPath)
        let entry = diaryEntries[indexPath.row]
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.font = UIFont(name: "Futura-CondensedExtraBold", size: 19)
        if (entry.date!.contains("01-"))  {
            cell.backgroundColor = UIColor.init(displayP3Red: 1.000, green: 1.000, blue: 1.000, alpha: 0.9)
            let aString = entry.date
            let janString = aString!.replacingOccurrences(of: "01-", with: "January ")
            cell.textLabel?.text = "\(janString)"
        } else if (entry.date!.contains("02-"))  {
            cell.backgroundColor = UIColor.init(displayP3Red: 1.000, green: 0.996, blue: 0.329, alpha: 0.9)
            let aString = entry.date
            let febString = aString!.replacingOccurrences(of: "02-", with: "February ")
            cell.textLabel?.text = "\(febString)"
        } else if (entry.date!.contains("03-")) {
             cell.backgroundColor = UIColor.init(displayP3Red: 0.541, green: 0.651, blue: 0.925, alpha: 0.9)
            let aString = entry.date
            let marchString = aString!.replacingOccurrences(of: "03-", with: "March ")
            cell.textLabel?.text = "\(marchString)"
        } else if (entry.date!.contains("04-")) {
            cell.backgroundColor = UIColor.init(displayP3Red: 0.639, green: 0.337, blue: 0.937, alpha: 0.9)
            let aString = entry.date
            let aprString = aString!.replacingOccurrences(of: "04-", with: "April ")
            cell.textLabel?.text = "\(aprString)"
        } else if (entry.date!.contains("05-")) {
            cell.backgroundColor = UIColor.init(displayP3Red: 0.933, green: 0.525, blue: 0.200, alpha: 0.9)
            let aString = entry.date
            let mayString = aString!.replacingOccurrences(of: "05-", with: "May ")
            cell.textLabel?.text = "\(mayString)"
        } else if (entry.date!.contains("06-")) {
            cell.backgroundColor = UIColor.init(displayP3Red: 0.914, green: 0.200, blue: 0.137, alpha: 0.9)
            let aString = entry.date
            let junString = aString!.replacingOccurrences(of: "06-", with: "June ")
            cell.textLabel?.text = "\(junString)"
        } else if (entry.date!.contains("07-")) {
            cell.backgroundColor = UIColor.init(displayP3Red: 0.471, green: 0.984, blue: 0.992, alpha: 0.9)
            let aString = entry.date
            let julString = aString!.replacingOccurrences(of: "07-", with: "July ")
            cell.textLabel?.text = "\(julString)"
        } else if (entry.date!.contains("08-")) {
            cell.backgroundColor = UIColor.init(displayP3Red: 0.471, green: 0.984, blue: 0.298, alpha: 0.9)
            let aString = entry.date
            let augString = aString!.replacingOccurrences(of: "08-", with: "August ")
            cell.textLabel?.text = "\(augString)"
        } else if (entry.date!.contains("09-")) {
            cell.backgroundColor = UIColor.init(displayP3Red: 0.925, green: 0.690, blue: 0.475, alpha: 0.9)
            let aString = entry.date
            let septString = aString!.replacingOccurrences(of: "09-", with: "September ")
            cell.textLabel?.text = "\(septString)"
        } else if (entry.date!.contains("10-")) {
            cell.backgroundColor = UIColor.init(displayP3Red: 0.212, green: 0.490, blue: 0.969, alpha: 0.9)
            let aString = entry.date
            let octString = aString!.replacingOccurrences(of: "10-", with: "October ")
            cell.textLabel?.text = "\(octString)"
        } else if (entry.date!.contains("11-")) {
            cell.backgroundColor = UIColor.init(displayP3Red: 0.502, green: 0.502, blue: 0.502, alpha: 0.9)
            let aString = entry.date
            let novString = aString!.replacingOccurrences(of: "11-", with: "November ")
            cell.textLabel?.text = "\(novString)"
        } else if (entry.date!.contains("12-")) {
            cell.backgroundColor = UIColor.init(displayP3Red: 0.910, green: 0.231, blue: 0.969, alpha: 0.9)
            let aString = entry.date
            let decString = aString!.replacingOccurrences(of: "12-", with: "December ")
            cell.textLabel?.text = "\(decString)"
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let entry = diaryEntries[indexPath.row]
        self.performSegue(withIdentifier: "goFromDiaryTableViewToComposerVC", sender: entry)
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

    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete  {
            let entry = self.diaryEntries[indexPath.row]
            
            let deleteAlertController = UIAlertController(title: "Are You Sure?", message: "This Will Delete All Data Contained Within This Entry For This Date Forever.", preferredStyle: .alert)
            
            let imSure = UIAlertAction(title: "I'm Sure", style: .destructive) { (action) in
                self.managedObjectContext.delete(entry)
                self.diaryEntries.remove(at: indexPath.row)
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

extension EntriesTableViewController: UISearchBarDelegate  {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        let request : NSFetchRequest<DiaryEntry> = DiaryEntry.fetchRequest()
        
        let predicate = NSPredicate(format: "date CONTAINS[cd] %@", searchBar.text!)
        let bodyPredicate = NSPredicate(format: "bodyText CONTAINS[cd] %@", searchBar.text!)
        let combinePredicate = NSCompoundPredicate(orPredicateWithSubpredicates: [predicate, bodyPredicate])
        
        request.predicate = combinePredicate
        
        do  {
            diaryEntries = try managedObjectContext.fetch(request)
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








