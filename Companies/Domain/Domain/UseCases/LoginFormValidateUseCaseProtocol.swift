//
//  LoginFormValidateUseCaseProtocol.swift
//  Domain
//
//  Created by Daniel Gomes on 24/10/20.
//

import Foundation

public protocol LoginFormValidateUseCaseProtocol: AnyObject {
    
    func execute(_ form: LoginForm, completion: (Result<Void, LoginFormValidateUseCaseError>) -> ())
}

