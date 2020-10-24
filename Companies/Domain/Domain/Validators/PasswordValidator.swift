//
//  PasswordValidator.swift
//  Domain
//
//  Created by Daniel Gomes on 24/10/20.
//

import Foundation

enum PasswordValidator: Error {
    
    case input(String)
}

extension PasswordValidator: Validatable {
    
    var result: ValidationResult {
        switch self {
        case .input(let input):
            if input.isEmpty {
                return .failure(.empty)
            } else if input.count < 6 {
                return .failure(.invalid)
            }
            return .success(())
        }
    }
}
