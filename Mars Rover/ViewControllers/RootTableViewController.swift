//
//  RootTableViewController.swift
//  Mars Rover
//
//  Created by Angus Muller on 05/12/2023.
//

import Foundation
import UIKit

class RootTableViewController: UITableViewController {
    
    var model: RoverPhotoViewModel?

    override func viewDidLoad() {
        super.viewDidLoad()

        refreshContent()
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model?.roverImagesCount() ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RoverCell", for: indexPath)
        
        if let rover = model?.roverImage(at: indexPath.row){
            cell.textLabel?.text = rover.camera.fullName
            cell.detailTextLabel?.text = rover.earthDate
        }
        
        return cell
    }


    // MARK: Helpers
    
    private func refreshContent() {
        
        guard let model = model else {
            fatalError("There is no model for RootTableViewController") // We would fail more elegantly in prod code
        }
        
        model.refresh { [weak self] (errorMessage) in
            DispatchQueue.main.async {
                guard let self = self else { return }
                
                if let errorMessage = errorMessage {
                    self.displayErrorToUser(message: errorMessage)
                }
                
                self.tableView.reloadData()
            }
        }
    }
    
    private func displayErrorToUser(message: String) {
        
        let alert = UIAlertController(title: "Error Loading Standings".localised(),
                          message: message.localised(),
                          preferredStyle: .alert)
        
        alert.addAction(.init(title: "Ok".localised(),
                              style: .default,
                              handler: nil))
        
        present(alert, animated: true, completion: nil)
    }
}
