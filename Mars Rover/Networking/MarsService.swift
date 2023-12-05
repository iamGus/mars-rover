//
//  MarsService.swift
//  Mars Rover
//
//  Created by Angus Muller on 05/12/2023.
//

import Foundation

protocol MarsService: APIService {
    func fetchRoverImageData(completion: @escaping (Result<[RoverPhoto], APIError>) -> ())
}
