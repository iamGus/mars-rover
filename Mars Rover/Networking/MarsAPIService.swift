//
//  MarsAPIService.swift
//  Mars Rover
//
//  Created by Angus Muller on 05/12/2023.
//

import Foundation

class MarsAPIService: MarsService {
  
    let session: URLSession
    
    init(configuration: URLSessionConfiguration) {
        self.session = URLSession(configuration: configuration)
    }
    
    convenience init() {
        self.init(configuration: .default)
    }
    
    func fetchRoverImageData(completion: @escaping (Result<[RoverPhoto], APIError>) -> ()) {
        let endpoint = NasaEndpoint.imageSearchByRover(rover: "curiosity")
        let request = endpoint.request
        
        fetch(with: request, responseType: RoverPhotoResponse.self, decode: { dataResponse in
            guard let roverResponse = dataResponse as? RoverPhotoResponse else {
                return []
            }
            return roverResponse.photos
        }, completion: completion)
    }
}
