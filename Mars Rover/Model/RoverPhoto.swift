//
//  RoverPhoto.swift
//  Mars Rover
//
//  Created by Angus Muller on 05/12/2023.
//

import Foundation

struct RoverPhoto: Codable {
    struct RoverCamera: Codable {
        let name: String
        let fullName: String
        var roverID: Int
        
        enum CodingKeys: String, CodingKey {
            case name
            case fullName = "full_name"
            case roverID = "rover_id"
        }
    }
    
    let id: Int
    let sol: Int
    let earthDate: String
    let camera: RoverCamera
    let photoUrl: String
    
    enum CodingKeys: String, CodingKey {
        case id, sol, camera
        case earthDate = "earth_date"
        case photoUrl = "img_src"
    }
    
 
}
