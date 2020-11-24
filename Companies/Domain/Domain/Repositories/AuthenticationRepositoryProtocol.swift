//
//  AuthenticationRepositoryProtocol.swift
//  Domain
//
//  Created by Daniel Gomes on 03/11/20.
//

import Foundation

public protocol AuthenticationRepositoryProtocol: AnyObject {
    
    func login(_ form: LoginForm, completion: @escaping GenericCompletion<AuthenticationResponse>)
    func getCredentials() throws -> Credentials
}
