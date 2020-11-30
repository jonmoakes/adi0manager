//
//  PupilListTableViewController.swift
//  ADI App
//
//  Created by Jonathan Oakes on 27/06/2018.
//  Copyright © 2018 Jonathan Oakes. All rights reserved.
//

import UIKit
import CoreData

class PupilListTableViewController: UITableViewController {
    
    var managedObjectContext: NSManagedObjectContext!
    var pupilEntries = [PupilEntries]()

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
    
    @IBAction func homePuttonPressed(_ sender: Any) {
        self.dismiss(animated: true)
    }
    func fetchEntries()  {
        //let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "PupilEntries")
        let fetchRequest = NSFetchRequest<PupilEntries>(entityName: "PupilEntries")
        let sort = NSSortDescriptor(key: "name", ascending: true)
        fetchRequest.sortDescriptors = [sort]
        do  {
            let entryObjects = try managedObjectContext.fetch(fetchRequest)
            self.pupilEntries = entryObjects as [PupilEntries]
        } catch let error as NSError  {
            print("Could Not Fetch Entries \(error.localizedDescription)")
        }
        self.tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pupilEntries.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PupilListCell", for: indexPath)
        let entry = self.pupilEntries[indexPath.row]
        
        cell.textLabel?.text = entry.name
        cell.textLabel?.font = UIFont(name: "Futura-CondensedExtraBold", size: 20)
        cell.textLabel?.textColor = UIColor.black
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let entry = pupilEntries[indexPath.row]
        
        let alertController = UIAlertController(title: "Choose An Option To View", message: "\nInfo:\nAddress, Test Dates, Phone Numbers Etc\n\nProgress:\nLesson Subject Grades And Notes\n\nBlock Bookings:\nKeep Track Of Your Pupils Remaining Hours On Their Block Booking", preferredStyle: .alert)
        
        let details = UIAlertAction(title: "Info", style: .default, handler: { action in self.performSegue(withIdentifier: "goFromPupilListTableViewToAddPupilVC", sender: entry)})
        alertController.addAction(details)
        
        let progressDetails = UIAlertAction(title: "Progress", style: .default, handler: { action in self.performSegue(withIdentifier: "progressButtonTappedToProgressVC", sender: entry)})
        alertController.addAction(progressDetails)
        
        let blockDetails = UIAlertAction(title: "Block Bookings", style: .default, handler: { action in self.performSegue(withIdentifier: "toBlockVC", sender: entry)})
        alertController.addAction(blockDetails)
        
        let cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alertController.addAction(cancel)
        
        self.present(alertController, animated: true, completion: nil)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goFromPupilListTableViewToAddPupilVC"  {
            let composeVC = segue.destination as! AddPupilViewController
            composeVC.pupilEntry = sender as? PupilEntries
        }
        
        if segue.identifier == "progressButtonTappedToProgressVC" {
            let progressVC = segue.destination as! ProgressViewController
            progressVC.progressEntry = sender as? PupilEntries
        }
        if segue.identifier == "toBlockVC" {
            let blockVC = segue.destination as! BlockBookingsViewController
            blockVC.blockEntries = sender as? PupilEntries
        }
    }
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if(indexPath.row % 2 == 0)  {
            cell.backgroundColor = .systemOrange
            let rotationTransform = CATransform3DTranslate(CATransform3DIdentity, -500, 10, 0)
            cell.layer.transform = rotationTransform
            cell.alpha = 0.3
            
            UIView.animate(withDuration: 0.5) {
                cell.layer.transform = CATransform3DIdentity
                cell.alpha = 1.0
            }
        }   else  {
            cell.backgroundColor = .systemBlue
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
            let entry = self.pupilEntries[indexPath.row]
            
            let deleteAlertController = UIAlertController(title: "Are You Sure?", message: "This Will Delete All Pupil Data\nIncluding Progress Reports And Block Booking Details", preferredStyle: .alert)
            
            let imSure = UIAlertAction(title: "I'm Sure", style: .destructive) { (action) in
                self.managedObjectContext.delete(entry)
                self.pupilEntries.remove(at: indexPath.row)
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

extension PupilListTableViewController: UISearchBarDelegate  {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        let request : NSFetchRequest<PupilEntries> = PupilEntries.fetchRequest()
        let predicate = NSPredicate(format: "name CONTAINS[cd] %@", searchBar.text!)
        request.predicate = predicate
        do  {
            pupilEntries = try managedObjectContext.fetch(request)
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
