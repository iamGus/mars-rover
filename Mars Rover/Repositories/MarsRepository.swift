//
//  MarsRepository.swift
//  Mars Rover
//
//  Created by Angus Muller on 05/12/2023.
//

import Foundation

enum MarsRepositoryError: Error {
    case noContent
    case connectionIssue
    
    init(_ error: APIError) {
        switch error {
        case .invalidData, .jsonConversionFailure, .jsonParsingFailure:
            self = .noContent
        case .requestFailed, .responseUnsuccessful:
            self = .connectionIssue
        }
    }
    
    // Readable description of error for user
    var errorDescription: String {
        switch self {
        case .noContent: return "Sorry no data could be retrieved"
        case .connectionIssue: return "Please check your internet connection"
        }
    }
}

class MarsRepository {
    private var marsService: MarsService
    
    init(marsService: MarsService) {
        self.marsService = marsService
    }
    
    func fetchMarsRoverPhotoData(completion: @escaping (Result<[RoverPhoto], MarsRepositoryError>) -> ()) {
        marsService.fetchRoverImageData { result in
            switch result {
            case .failure(let error):
                completion(.failure(.init(error)))
            case .success(let standingList):
                guard !standingList.isEmpty else {
                    completion(.failure(.noContent))
                    return
                }
                completion(.success(standingList))
            }
        }
    }
}
