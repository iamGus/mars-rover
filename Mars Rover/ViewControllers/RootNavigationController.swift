//
//  RootNavigationController.swift
//  Mars Rover
//
//  Created by Angus Muller on 05/12/2023.
//

import UIKit

class RootNaviagtionController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        if let rootTableViewController = topViewController as? RootTableViewController {
            
            let marsService = MarsAPIService()
            let repository = MarsRepository(marsService: marsService)
            rootTableViewController.model = RoverPhotoViewModel(marsRepository: repository)
        }
    }
}
