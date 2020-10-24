//
//  ContainerValidator.swift
//  Domain
//
//  Created by Daniel Gomes on 24/10/20.
//

import Foundation

protocol ContainerValidatable {
    
    var isValid: Bool { get }
}

class ContainerValidator {
    
    private let validators: [Validatable]
    
    init(validators: [Validatable]) {
        self.validators = validators
    }
}

extension ContainerValidator: ContainerValidatable {
    
    var isValid: Bool {
        return validators.compactMap({ $0.result.failure }).isEmpty
    }
}
