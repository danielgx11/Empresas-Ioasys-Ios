//
//  Validatable.swift
//  Domain
//
//  Created by Daniel Gomes on 24/10/20.
//

import Foundation

enum FormValidationError: Error {
    case empty
    case invalid
}

typealias ValidationResult = Result<Void, FormValidationError>

protocol Validatable {
    
    var result: ValidationResult { get }
}
