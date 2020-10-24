//
//  EmailValidator.swift
//  Domain
//
//  Created by Daniel Gomes on 24/10/20.
//

import Foundation

enum EmailValidator {
    
    case input(String)
}

extension EmailValidator: Validatable {
    
    var result: ValidationResult {
        switch self {
        case .input(let input):
            if input.isEmpty {
                return .failure(.empty)
            } else if !input.isValidEmail {
                return .failure(.invalid)
            }
            return .success(())
        }
    }
}

fileprivate extension String {
    
    var isValidEmail: Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let emailTest = NSPredicate(format: "SELF MATCHES %@", emailRegEx)
        let result = emailTest.evaluate(with: self)
        return result
    }
}
