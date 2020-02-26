//
//  IncomeTableViewController.swift
//  ADI App
//
//  Created by Jonathan Oakes on 26/03/2019.
//  Copyright © 2019 Jonathan Oakes. All rights reserved.
//

import UIKit
import CoreData

class IncomeTableViewController: UITableViewController {
    
    var managedObjectContext: NSManagedObjectContext!
    var incomeEntries = [IncomeEntries]()

    @IBOutlet var searchBar: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        managedObjectContext = appDelegate.persistentContainer.viewContext
        tableView.tableFooterView = UIView(frame: CGRect.zero)
        
        setUpNavBar()
        title = "Income"
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
    
    func setUpNavBar()  {
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    func fetchEntries()  {
        let fetchRequest = NSFetchRequest<IncomeEntries>(entityName: "IncomeEntries")
        let dateSort = NSSortDescriptor(key: "date", ascending: false)
        fetchRequest.sortDescriptors = [dateSort]
        do  {
            let entryObjects = try managedObjectContext.fetch(fetchRequest)
            self.incomeEntries = entryObjects as [IncomeEntries]
        } catch let error as NSError  {
            print("Could Not Fetch Entries \(error.localizedDescription)")
        }
        self.tableView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToAddNewIncomeVC"  {
            let composeVC = segue.destination as! AddIncomeViewController
            composeVC.incomeEntry = sender as? IncomeEntries
        }
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return incomeEntries.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let entry = incomeEntries[indexPath.row]
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.font = UIFont(name: "Futura-CondensedExtraBold", size: 19)
        cell.textLabel?.text = "\(entry.date ?? "Date")\nTotal Received - £\(entry.incomeAmount ?? "0")"
    
        if (entry.date!.contains("01-"))  {
            let aString = entry.date
            let janString = aString!.replacingOccurrences(of: "01-", with: "January ")
            cell.textLabel?.text = "\(janString)\nName - \(entry.name ?? "Pupil")\nIncome Received - £\(entry.incomeAmount ?? "0")"
            cell.backgroundColor = UIColor.init(displayP3Red: 1.000, green: 1.000, blue: 1.000, alpha: 0.9)
        } else if (entry.date!.contains("02-"))  {
            let aString = entry.date
            let febString = aString!.replacingOccurrences(of: "02-", with: "February ")
            cell.textLabel?.text = "\(febString)\nName - \(entry.name ?? "Pupil")\nIncome Received - £\(entry.incomeAmount ?? "0")"
            cell.backgroundColor = UIColor.init(displayP3Red: 1.000, green: 0.996, blue: 0.329, alpha: 0.9)
        } else if (entry.date!.contains("03-"))  {
            let aString = entry.date
            let marString = aString!.replacingOccurrences(of: "03-", with: "March ")
            cell.textLabel?.text = "\(marString)\nName - \(entry.name ?? "Pupil")\nIncome Received - £\(entry.incomeAmount ?? "0")"
            cell.backgroundColor = UIColor.init(displayP3Red: 0.541, green: 0.651, blue: 0.925, alpha: 0.9)
        } else if (entry.date!.contains("04-"))  {
            let aString = entry.date
            let aprString = aString!.replacingOccurrences(of: "04-", with: "April ")
            cell.textLabel?.text = "\(aprString)\nName - \(entry.name ?? "Pupil")\nIncome Received - £\(entry.incomeAmount ?? "0")"
            cell.backgroundColor = UIColor.init(displayP3Red: 0.639, green: 0.337, blue: 0.937, alpha: 0.9)
        } else if (entry.date!.contains("05-"))  {
            let aString = entry.date
            let mayString = aString!.replacingOccurrences(of: "05-", with: "May ")
            cell.textLabel?.text = "\(mayString)\nName - \(entry.name ?? "Pupil")\nIncome Received - £\(entry.incomeAmount ?? "0")"
            cell.backgroundColor = UIColor.init(displayP3Red: 0.933, green: 0.525, blue: 0.200, alpha: 0.9)
        } else if (entry.date!.contains("06-"))  {
            let aString = entry.date
            let junString = aString!.replacingOccurrences(of: "06-", with: "June ")
            cell.textLabel?.text = "\(junString)\nName - \(entry.name ?? "Pupil")\nIncome Received - £\(entry.incomeAmount ?? "0")"
            cell.backgroundColor = UIColor.init(displayP3Red: 0.914, green: 0.200, blue: 0.137, alpha: 0.9)
        } else if (entry.date!.contains("07-"))  {
            let aString = entry.date
            let julString = aString!.replacingOccurrences(of: "07-", with: "July ")
            cell.textLabel?.text = "\(julString)\nName - \(entry.name ?? "Pupil")\nIncome Received - £\(entry.incomeAmount ?? "0")"
            cell.backgroundColor = UIColor.init(displayP3Red: 0.471, green: 0.984, blue: 0.992, alpha: 0.9)
        } else if (entry.date!.contains("08-"))  {
            let aString = entry.date
            let augString = aString!.replacingOccurrences(of: "08-", with: "August ")
            cell.textLabel?.text = "\(augString)\nName - \(entry.name ?? "Pupil")\nIncome Received - £\(entry.incomeAmount ?? "0")"
            cell.backgroundColor = UIColor.init(displayP3Red: 0.471, green: 0.984, blue: 0.298, alpha: 0.9)
        } else if (entry.date!.contains("09-"))  {
            let aString = entry.date
            let sepString = aString!.replacingOccurrences(of: "09-", with: "September ")
            cell.textLabel?.text = "\(sepString)\nName - \(entry.name ?? "Pupil")\nIncome Received - £\(entry.incomeAmount ?? "0")"
            cell.backgroundColor = UIColor.init(displayP3Red: 0.925, green: 0.690, blue: 0.475, alpha: 0.9)
        } else if (entry.date!.contains("10-"))  {
            let aString = entry.date
            let octString = aString!.replacingOccurrences(of: "10-", with: "October ")
            cell.textLabel?.text = "\(octString)\nName - \(entry.name ?? "Pupil")\nIncome Received - £\(entry.incomeAmount ?? "0")"
            cell.backgroundColor = UIColor.init(displayP3Red: 0.212, green: 0.490, blue: 0.969, alpha: 0.9)
        } else if (entry.date!.contains("11-"))  {
            let aString = entry.date
            let novString = aString!.replacingOccurrences(of: "11-", with: "November ")
            cell.textLabel?.text = "\(novString)\nName - \(entry.name ?? "Pupil")\nIncome Received - £\(entry.incomeAmount ?? "0")"
            cell.backgroundColor = UIColor.init(displayP3Red: 0.502, green: 0.502, blue: 0.502, alpha: 0.9)
        } else if (entry.date!.contains("12-"))  {
            let aString = entry.date
            let decString = aString!.replacingOccurrences(of: "12-", with: "December ")
            cell.textLabel?.text = "\(decString)\nName - \(entry.name ?? "Pupil")\nIncome Received - £\(entry.incomeAmount ?? "0")"
            cell.backgroundColor = UIColor.init(displayP3Red: 0.910, green: 0.231, blue: 0.969, alpha: 0.90)
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let entry = incomeEntries[indexPath.row]
        self.performSegue(withIdentifier: "goToAddNewIncomeVC", sender: entry)
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
            let entry = self.incomeEntries[indexPath.row]
            
            let deleteAlertController = UIAlertController(title: "Are You Sure?", message: "This Will Delete All Data Entered For This Lesson Forever.", preferredStyle: .alert)
            
            let imSure = UIAlertAction(title: "I'm Sure", style: .destructive) { (action) in
                self.managedObjectContext.delete(entry)
                self.incomeEntries.remove(at: indexPath.row)
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

extension IncomeTableViewController: UISearchBarDelegate  {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        let request : NSFetchRequest<IncomeEntries> = IncomeEntries.fetchRequest()
        let predicate = NSPredicate(format: "date CONTAINS[cd] %@", searchBar.text!)
        let namePredicate = NSPredicate(format: "name CONTAINS[cd] %@", searchBar.text!)
        let combinePredicate = NSCompoundPredicate(orPredicateWithSubpredicates: [predicate, namePredicate])
        request.predicate = combinePredicate
        do  {
            incomeEntries = try managedObjectContext.fetch(request)
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
