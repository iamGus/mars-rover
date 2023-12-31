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
    static let modalConstant = "FullPhotoSegue"

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(RoverPhotoCell.self, forCellReuseIdentifier: RoverPhotoCell.reuseIdentifier)
        refreshContent()
    }
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        80
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model?.roverImagesCount() ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: RoverPhotoCell.reuseIdentifier, for: indexPath) as? RoverPhotoCell else {
            return UITableViewCell()
        }
        
        if let rover = model?.roverImage(at: indexPath.row) {
            cell.configure(with: rover)
        }
        
        return cell
    }
    
    // MARK: - Navigation
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: Self.modalConstant, sender: indexPath.row)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == Self.modalConstant {
            if let row = sender as? Int,
               let rover = model?.roverImage(at: row),
                let fullPhotoController = segue.destination as? FullPhotoViewController {
                
                fullPhotoController.rover = rover
            }
        }
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
