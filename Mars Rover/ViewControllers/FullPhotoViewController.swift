//
//  FullPhotoViewController.swift
//  Mars Rover
//
//  Created by Angus Muller on 05/12/2023.
//

import UIKit

class FullPhotoViewController: UIViewController {
    @IBOutlet weak var marsImageView: UIImageView!
    
    var rover: RoverPhoto?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        marsImageView.kf.setImage(with: rover?.photoUrl)
    }
    
}
