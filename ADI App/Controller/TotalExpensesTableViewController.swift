//
//  TotalExpensesTableViewController.swift
//  ADI App
//
//  Created by Jonathan Oakes on 29/06/2018.
//  Copyright © 2018 Jonathan Oakes. All rights reserved.
//

import UIKit
import CoreData

class TotalExpensesTableViewController: UITableViewController {

    var managedObjectContext: NSManagedObjectContext!
    var totalExpensesEntries = [TotalExpenses]()
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
        super.viewWillAppear(animated)
        self.fetchEntries()
        let backgroundImage = UIImage(named: "ADI-4")
        let imageView = UIImageView(image: backgroundImage)
        self.tableView.backgroundView = imageView
        imageView.contentMode = .scaleAspectFill
        imageView.alpha = 0.6
    }
   
    func fetchEntries()  {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "TotalExpenses")
        do  {
            let entryObjects = try managedObjectContext.fetch(fetchRequest)
            self.totalExpensesEntries = entryObjects as! [TotalExpenses]
        } catch let error as NSError  {
            print("Could Not Fetch Entries \(error.localizedDescription)")
        }
        self.tableView.reloadData()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return totalExpensesEntries.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TotalExpensesCell", for: indexPath)
        cell.textLabel?.textColor = UIColor.black
        
        let date = Date()
        let calendar = Calendar.current
        let year = calendar.component(.year, from: date)
        let entry = self.totalExpensesEntries[indexPath.row]
        
        if entry.totalAmountForWeek != ""  {
            cell.backgroundColor = UIColor.init(displayP3Red: 1.000, green: 0.996, blue: 0.329, alpha: 0.9)
        } else if entry.totalAmountForMonth != "" {
            cell.backgroundColor = UIColor.init(displayP3Red: 0.471, green: 0.980, blue: 0.298, alpha: 0.9)
        } else {
            cell.backgroundColor = UIColor.init(displayP3Red: 0.910, green: 0.231, blue: 0.969, alpha: 0.9)
        }
        
        if entry.weekEndingDate != "" && entry.totalAmountForWeek != ""  {
            cell.textLabel?.text = "Total Entry For the Week Ending:\n\(entry.weekEndingDate!)\n£\(entry.totalAmountForWeek!)"
        }
        
        if entry.totalAmountForMonth != "" {
            cell.textLabel?.text = "Total Entry For The Month Of:\n\(entry.month!), \(year)\n£\(entry.totalAmountForMonth!)"
        }
        
        if entry.totalAmountForYear != ""  {
            cell.textLabel?.text = "Total Entry For The Year:\n\(entry.year!)\n£\(entry.totalAmountForYear!)"
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
        let entry = totalExpensesEntries[indexPath.row]
        self.performSegue(withIdentifier: "goFromTotalExpensesTvcToAddNewTotalExpensesVC", sender: entry)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goFromTotalExpensesTvcToAddNewTotalExpensesVC"  {
            let composeVC = segue.destination as! AddTotalExpensesViewController
            composeVC.totalExpensesEntry = sender as? TotalExpenses
        }
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete  {
            let entry = self.totalExpensesEntries[indexPath.row]
            
            let deleteAlertController = UIAlertController(title: "Are You Sure?", message: "This Will Delete All Data Contained Within This Entry Forever.", preferredStyle: .alert)
            
            let imSure = UIAlertAction(title: "I'm Sure", style: .destructive) { (action) in
                self.managedObjectContext.delete(entry)
                self.totalExpensesEntries.remove(at: indexPath.row)
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
            
            present(deleteAlertController, animated: true, completion: nil)
        }
    }
}

extension TotalExpensesTableViewController: UISearchBarDelegate  {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        let request : NSFetchRequest<TotalExpenses> = TotalExpenses.fetchRequest()
        
        let weekEndingPredicate = NSPredicate(format: "weekEndingDate CONTAINS[cd] %@", searchBar.text!)
        let monthPredicate = NSPredicate(format: "month CONTAINS[cd] %@", searchBar.text!)
        let yearPredicate = NSPredicate(format: "year CONTAINS[cd] %@", searchBar.text!)
        let totalForWeekPredicate = NSPredicate(format: "totalAmountForWeek CONTAINS[cd] %@", searchBar.text!)
        let totalForMonthPredicate = NSPredicate(format: "totalAmountForMonth CONTAINS[cd] %@", searchBar.text!)
        let totalForYearPredicate = NSPredicate(format: "totalAmountForYear CONTAINS[cd] %@", searchBar.text!)
        
        
        let combinedPredicate = NSCompoundPredicate(orPredicateWithSubpredicates: [weekEndingPredicate, monthPredicate, yearPredicate, totalForWeekPredicate, totalForMonthPredicate, totalForYearPredicate])
        
        request.predicate = combinedPredicate
        
        do  {
            totalExpensesEntries = try managedObjectContext.fetch(request)
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

