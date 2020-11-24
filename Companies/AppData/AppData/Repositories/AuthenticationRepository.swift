//
//  AuthenticationRepository.swift
//  AppData
//
//  Created by Daniel Gomes on 24/11/20.
//

import Domain

public class AuthenticationRepository {
        
    private let authenticationLocalDataSource: AuthenticationLocalDataSourceProtocol
    private let authenticationRemoteDataSource: AuthenticationRemoteDataSourceProtocol
    
    public init(authenticationLocalDataSource: AuthenticationLocalDataSourceProtocol,
                authenticationRemoteDataSource: AuthenticationRemoteDataSourceProtocol) {
        
        self.authenticationLocalDataSource = authenticationLocalDataSource
        self.authenticationRemoteDataSource = authenticationRemoteDataSource
    }
}

extension AuthenticationRepository: Domain.AuthenticationRepositoryProtocol {
    public func login(_ form: LoginForm, completion: @escaping GenericCompletion<AuthenticationResponse>) {
        do {
            let credentials = try authenticationLocalDataSource.getCredentials()
            authenticationRemoteDataSource.authentication(credentials: credentials) { [weak self] (result) in
                guard let self = self else { return }
                
                switch result {
                case .success(let response):
                    do {
                        try self.authenticationLocalDataSource.save(response: response)
                        completion(.success(response))
                    } catch let error {
                        completion(.failure(error.asAnyError))
                    }
                case .failure(let error):
                    completion(.failure(error.asAnyError))
                }
            }
        } catch let error {
            completion(.failure(error.asAnyError))
        }
    }
    
    public func getCredentials() throws -> Credentials {
        do {
            let credentials = try authenticationLocalDataSource.getCredentials()
            return credentials
        } catch let error {
            throw error
        }
    }
}
