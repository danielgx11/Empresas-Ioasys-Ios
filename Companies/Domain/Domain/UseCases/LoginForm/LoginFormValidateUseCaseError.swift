//
//  LoginFormValidateUseCaseError.swift
//  Domain
//
//  Created by Daniel Gomes on 24/10/20.
//

import Foundation

public enum LoginFormValidateUseCaseError: Error {
    
    public enum Email {
        case empty
        case invalid
    }
    
    public enum Password {
        case empty
        case weak
    }
    
    case email(Email)
    case password(Password)
}
