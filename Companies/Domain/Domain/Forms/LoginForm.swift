//
//  LoginForm.swift
//  Domain
//
//  Created by Daniel Gomes on 24/10/20.
//

import Foundation

public struct LoginForm {
    
    public let email: String
    public let password: String
    
    public init(email: String, password: String) {
        self.email = email
        self.password = password
    }
}
