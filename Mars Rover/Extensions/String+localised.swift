//
//  String+localised.swift
//  Mars Rover
//
//  Created by Angus Muller on 05/12/2023.
//

import Foundation

extension String {
    
    func localised(comment: String = "") -> String {
        return NSLocalizedString(self, comment: comment)
    }
}
