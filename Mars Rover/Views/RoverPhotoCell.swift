//
//  RoverPhotoCell.swift
//  Mars Rover
//
//  Created by Angus Muller on 05/12/2023.
//

import UIKit
import Kingfisher

class RoverPhotoCell: UITableViewCell {
    static let reuseIdentifier = String(describing: RoverPhotoCell.self)
    
    private var marsImageView: UIImageView = .init()
    
    private lazy var cameraTitle: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16.0, weight: .medium)
        label.textColor = .black
        return label
    }()
    
    private lazy var earthDateLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 12.0, weight: .medium)
        label.textColor = .darkGray
        return label
    }()
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupConstraints()
    }
    
    func configure(with rover: RoverPhoto) {
        marsImageView.kf.setImage(with: rover.photoUrl, options: [.transition(.fade(0.2))])
        cameraTitle.text = rover.camera.fullName
        earthDateLabel.text = rover.earthDate
    }
    
    private func setupConstraints() {
        marsImageView.translatesAutoresizingMaskIntoConstraints = false
        cameraTitle.translatesAutoresizingMaskIntoConstraints  = false
        earthDateLabel.translatesAutoresizingMaskIntoConstraints = false
        marsImageView.contentMode = UIView.ContentMode.scaleToFill
        self.contentView.addSubview(marsImageView)
        
        
        self.marsImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10).isActive = true
        self.marsImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        self.marsImageView.heightAnchor.constraint(equalToConstant: 70).isActive = true
        self.marsImageView.widthAnchor.constraint(equalToConstant: 70).isActive = true
        
        self.contentView.addSubview(cameraTitle)
        
        self.cameraTitle.leadingAnchor.constraint(equalTo: marsImageView.trailingAnchor, constant: 20).isActive = true
        self.cameraTitle.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 3).isActive = true
        
        self.contentView.addSubview(earthDateLabel)
        
        self.earthDateLabel.leadingAnchor.constraint(equalTo: marsImageView.trailingAnchor, constant: 20).isActive = true
        self.earthDateLabel.topAnchor.constraint(equalTo: cameraTitle.bottomAnchor, constant: 10).isActive = true
    }
}
