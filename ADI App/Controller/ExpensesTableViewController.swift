//
//  ExpensesTableViewController.swift
//  ADI App
//
//  Created by Jonathan Oakes on 27/06/2018.
//  Copyright © 2018 Jonathan Oakes. All rights reserved.
//

import UIKit
import CoreData

class ExpensesTableViewController: UITableViewController {
    
    var managedObjectContext: NSManagedObjectContext!
    var expensesEntries = [ExpensesEntries]()
    @IBOutlet var expensesTable: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpNavBar()
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        managedObjectContext = appDelegate.persistentContainer.viewContext
        tableView.tableFooterView = UIView(frame: CGRect.zero)

        self.title = "Expenses Claimed"
        let frame = CGRect(x: 0, y: 0, width: 200, height: 40)
        let tlabel = UILabel(frame: frame)
        tlabel.text = self.title
        tlabel.textColor = UIColor.black
        tlabel.font = UIFont(name: "Futura-CondensedExtraBold", size: 19)!
        tlabel.adjustsFontSizeToFitWidth = true
        tlabel.textAlignment = .center
        self.navigationItem.titleView = tlabel
 
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
        let fetchRequest = NSFetchRequest<ExpensesEntries>(entityName: "ExpensesEntries")
        let sort = NSSortDescriptor(key: "date", ascending: false)
       fetchRequest.sortDescriptors = [sort]
        do  {
            let entryObjects = try managedObjectContext.fetch(fetchRequest)
            self.expensesEntries = entryObjects as [ExpensesEntries]
        } catch let error as NSError  {
            print("Could Not Fetch Entries \(error.localizedDescription)")
        }
        self.tableView.reloadData()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return expensesEntries.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "expensesCell", for: indexPath)
        
        let entry = self.expensesEntries[indexPath.row]
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.font = UIFont(name: "Futura-CondensedExtraBold", size: 20)
        cell.textLabel?.textColor = UIColor.black
        
        if (entry.date?.contains("Monday"))!  {
            cell.backgroundColor = UIColor.init(displayP3Red: 0.922, green: 0.749, blue: 0.431, alpha: 0.9)
        }  else if (entry.date?.contains("Tuesday"))!  {
            cell.backgroundColor = UIColor.init(displayP3Red: 0.898, green: 0.220, blue: 0.212, alpha: 0.9)
        }  else if (entry.date?.contains("Wednesday"))!  {
            cell.backgroundColor = UIColor.init(displayP3Red: 1.000, green: 0.996, blue: 0.333, alpha: 0.9)
        }  else if (entry.date?.contains("Thursday"))!  {
            cell.backgroundColor = UIColor.init(displayP3Red: 0.478, green: 0.757, blue: 0.925, alpha: 0.9)
        }  else if (entry.date?.contains("Friday"))!  {
            cell.backgroundColor = UIColor.init(displayP3Red: 0.902, green: 0.204, blue: 0.529, alpha: 0.9)
        }  else if (entry.date?.contains("Saturday"))!  {
            cell.backgroundColor = UIColor.init(displayP3Red: 0.812, green: 0.988, blue: 0.318, alpha: 0.9)
        }  else if (entry.date?.contains("Sunday"))!  {
            cell.backgroundColor = UIColor.init(displayP3Red: 0.910, green: 0.231, blue: 0.969, alpha: 0.9)
        }
        
        if (entry.date!.contains("01-"))  {
            let aString = entry.date
            let janString = aString!.replacingOccurrences(of: "01-", with: "January ")
            cell.textLabel?.text = "\(janString)\n\(entry.receiptDescription!)\n£\(entry.receiptAmount!)"
        } else if (entry.date!.contains("02-"))  {
            let aString = entry.date
            let febString = aString!.replacingOccurrences(of: "02-", with: "February ")
            cell.textLabel?.text = "\(febString)\n\(entry.receiptDescription!)\n£\(entry.receiptAmount!)"
        } else if (entry.date!.contains("03-"))  {
            let aString = entry.date
            let marString = aString!.replacingOccurrences(of: "03-", with: "March ")
            cell.textLabel?.text = "\(marString)\n\(entry.receiptDescription!)\n£\(entry.receiptAmount!)"
        } else if (entry.date!.contains("04-"))  {
            let aString = entry.date
            let aprString = aString!.replacingOccurrences(of: "04-", with: "April ")
            cell.textLabel?.text = "\(aprString)\n\(entry.receiptDescription!)\n£\(entry.receiptAmount!)"
        } else if (entry.date!.contains("05-"))  {
            let aString = entry.date
            let mayString = aString!.replacingOccurrences(of: "05-", with: "May ")
            cell.textLabel?.text = "\(mayString)\n\(entry.receiptDescription!)\n£\(entry.receiptAmount!)"
        } else if (entry.date!.contains("06-"))  {
            let aString = entry.date
            let junString = aString!.replacingOccurrences(of: "06-", with: "June ")
            cell.textLabel?.text = "\(junString)\n\(entry.receiptDescription!)\n£\(entry.receiptAmount!)"
        } else if (entry.date!.contains("07-"))  {
            let aString = entry.date
            let julString = aString!.replacingOccurrences(of: "07-", with: "July ")
            cell.textLabel?.text = "\(julString)\n\(entry.receiptDescription!)\n£\(entry.receiptAmount!)"
        } else if (entry.date!.contains("08-"))  {
            let aString = entry.date
            let augString = aString!.replacingOccurrences(of: "08-", with: "August ")
            cell.textLabel?.text = "\(augString)\n\(entry.receiptDescription!)\n£\(entry.receiptAmount!)"
        } else if (entry.date!.contains("09-"))  {
            let aString = entry.date
            let sepString = aString!.replacingOccurrences(of: "09-", with: "September ")
            cell.textLabel?.text = "\(sepString)\n\(entry.receiptDescription!)\n£\(entry.receiptAmount!)"
        } else if (entry.date!.contains("10-"))  {
            let aString = entry.date
            let octString = aString!.replacingOccurrences(of: "10-", with: "October ")
            cell.textLabel?.text = "\(octString)\n\(entry.receiptDescription!)\n£\(entry.receiptAmount!)"
        } else if (entry.date!.contains("11-"))  {
            let aString = entry.date
            let novString = aString!.replacingOccurrences(of: "11-", with: "November ")
            cell.textLabel?.text = "\(novString)\n\(entry.receiptDescription!)\n£\(entry.receiptAmount!)"
        } else if (entry.date!.contains("12-"))  {
            let aString = entry.date
            let decString = aString!.replacingOccurrences(of: "12-", with: "December ")
            cell.textLabel?.text = "\(decString)\n\(entry.receiptDescription!)\n£\(entry.receiptAmount!)"
        }
        return cell
    }
    
// Animating Tables
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
        let entry = expensesEntries[indexPath.row]
        self.performSegue(withIdentifier: "goFromExpensesTableViewControllerToAddExpensesVC", sender: entry)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goFromExpensesTableViewControllerToAddExpensesVC"  {
            let composeVC = segue.destination as! ExpensesViewController
            composeVC.expensesEntry = sender as? ExpensesEntries
        }
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete  {
            let entry = self.expensesEntries[indexPath.row]
            
            let deleteAlertController = UIAlertController(title: "Are You Sure?", message: "This Will Delete All Data Contained Within This Entry Forever.", preferredStyle: .alert)
            
            let imSure = UIAlertAction(title: "I'm Sure", style: .destructive) { (action) in
                self.managedObjectContext.delete(entry)
                self.expensesEntries.remove(at: indexPath.row)
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

extension ExpensesTableViewController: UISearchBarDelegate  {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        let request : NSFetchRequest<ExpensesEntries> = ExpensesEntries.fetchRequest()
        
        let datePredicate = NSPredicate(format: "date CONTAINS[cd] %@", searchBar.text!)
        let receiptAmountPredicate = NSPredicate(format: "receiptAmount CONTAINS[cd] %@", searchBar.text!)
        let receiptDescriptionPredicate = NSPredicate(format: "receiptDescription CONTAINS[cd] %@", searchBar.text!)
        
        let combinedPredicate = NSCompoundPredicate(orPredicateWithSubpredicates: [datePredicate, receiptAmountPredicate, receiptDescriptionPredicate])
        
        request.predicate = combinedPredicate
        
        do  {
            expensesEntries = try managedObjectContext.fetch(request)
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
