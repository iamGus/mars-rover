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
        
        let rover: [RoverPhoto]? = UserDefaults.standard.retrieveCodable(for: "RoverPhotosData")
        self.roverPhotos = rover ?? []
    }
    
    func refresh(completion: @escaping (_ errorMessage: String?) -> ()) {
        
        marsRepository.fetchMarsRoverPhotoData { result in
            switch result {
            case .failure(let error):
                completion(error.errorDescription)
                
            case .success(let roverPhotos):
                let shuffledRovers = roverPhotos.shuffled()
                self.roverPhotos = shuffledRovers
                // TODO: Use better persistence for data and not UserDefaults!
                // Also Repository/service would normally deal with persistence, not in viewModel
                UserDefaults.standard.storeCodable(shuffledRovers, key: "RoverPhotosData")
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
