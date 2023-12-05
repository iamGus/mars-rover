//
//  RoverPhotoResponse.swift
//  Mars Rover
//
//  Created by Angus Muller on 05/12/2023.
//

import Foundation

struct RoverPhotoResponse: Decodable {
    let photos: [RoverPhoto]
}
