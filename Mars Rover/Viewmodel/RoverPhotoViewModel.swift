//
//  RoverPhotoViewModel.swift
//  Mars Rover
//
//  Created by Angus Muller on 05/12/2023.
//

import Foundation

class RoverPhotoViewModel {
    
    private var roverPhotos: [RoverPhoto]
 
    private var marsRepository: MarsRepository
    
    init(marsRepository: MarsRepository) {
        self.marsRepository = marsRepository
        self.roverPhotos = []
    }
    
    /// Gets the latest set of Driver Standings
    func refresh(completion: @escaping (_ errorMessage: String?) -> ()) {
        
        marsRepository.fetchMarsRoverPhotoData { result in
            switch result {
            case .failure(let error):
                completion(error.errorDescription)
                
            case .success(let roverPhotos):
                self.roverPhotos = roverPhotos
                completion(nil)
            }
        }
    }
}

// MARK: - Standing data

extension RoverPhotoViewModel {
    func allImages() -> [RoverPhoto]? {
        return roverPhotos
    }
    
    func roverImage(at index: Int) -> RoverPhoto? {
        
        guard index < roverImagesCount() else {
            return nil
        }
        return allImages()?[index]
    }
    
    func roverImagesCount() -> Int {
        return roverPhotos.count
    }
    
}
