//
//  UsefulLinksViewController.swift
//  ADI App
//
//  Created by Jonathan Oakes on 02/03/2019.
//  Copyright © 2019 Jonathan Oakes. All rights reserved.
//

import UIKit
import SafariServices

class UsefulLinksViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Useful Links"
    }
    
    
    @IBAction func dvsaButtonTapped(_ sender: Any) {
        showDvsaWebsite(for: "https://www.gov.uk/government/organisations/driver-and-vehicle-standards-agency")
    }
    
    @IBAction func highwayCodeButtonPressed(_ sender: Any) {
        showHighwayCodeWebsite(for: "https://www.gov.uk/guidance/the-highway-code")
    }
    
    @IBAction func govButtonTapped(_ sender: Any) {
        showGovWebsite(for: "https://www.gov.uk/browse/driving/teaching-people-to-drive")
    }
    
    @IBAction func dvlaButtonTapped(_ sender: Any) {
        showDvlaWebsite(for: "https://www.gov.uk/government/organisations/driver-and-vehicle-licensing-agency")
    }
    
    func showDvsaWebsite(for url: String) {
        guard let url = URL(string: url) else {
            return
        }
     
        let websiteVC = SFSafariViewController(url: url)
        present(websiteVC, animated: true)
     }
    
    func showHighwayCodeWebsite(for url: String) {
        guard let url = URL(string: url) else {
            return
        }
        
        let websiteVC = SFSafariViewController(url: url)
        present(websiteVC, animated: true)
    }
    
    func showGovWebsite(for url: String) {
        guard let url = URL(string: url) else {
            return
        }
        
        let websiteVC = SFSafariViewController(url: url)
        present(websiteVC, animated: true)
    }
    
    func showDvlaWebsite(for url: String) {
        guard let url = URL(string: url) else {
            return
        }
        
        let websiteVC = SFSafariViewController(url: url)
        present(websiteVC, animated: true)
    }
    
    
   

}
