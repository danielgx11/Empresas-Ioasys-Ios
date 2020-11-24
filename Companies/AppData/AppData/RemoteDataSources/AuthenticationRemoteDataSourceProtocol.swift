//
//  AuthenticationRemoteDataSourceProtocol.swift
//  AppData
//
//  Created by Daniel Gomes on 24/11/20.
//

import Domain

public protocol AuthenticationRemoteDataSourceProtocol {

    func authentication(credentials: Credentials,
                        completion: @escaping GenericCompletion<AuthenticationResponse>)
}
