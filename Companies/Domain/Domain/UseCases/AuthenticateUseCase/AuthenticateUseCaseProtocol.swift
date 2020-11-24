//
//  AuthenticateUseCaseProtocol.swift
//  Domain
//
//  Created by Daniel Gomes on 24/10/20.
//

import Foundation

public protocol AuthenticateUseCaseProtocol: AnyObject {
    
    func execute(_ form: LoginForm, completion: @escaping GenericCompletion<AuthenticationResponse>)
}
