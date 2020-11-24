//
//  AuthenticationLocalDataSourceProtocol.swift
//  AppData
//
//  Created by Daniel Gomes on 24/11/20.
//

import Domain

public protocol AuthenticationLocalDataSourceProtocol: AnyObject {
    func save(response: AuthenticationResponse) throws
    func save(credentials: Credentials) throws
    
    func getCredentials() throws -> Credentials
}
