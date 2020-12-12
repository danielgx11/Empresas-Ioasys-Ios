//
//  AuthenticationRemoteDataSource.swift
//  Networking
//
//  Created by Daniel Gomes on 12/12/20.
//

import Domain
import AppData
import OxeNetworking
import Moya 

public class AuthenticationRemoteDataSource {

    let dispacher: Dispatcher

    public init(dispacher: Dispatcher) {
        self.dispacher = dispacher
    }

    private func handle(response: Response, completion: Domain.GenericCompletion<AuthenticationResponse>) {
        let unknownError = InteractionError.unknownError

        #warning("TODO: Error Handling here")
        
        guard let encodedResponse = try? response.response(encoding: .isoLatin1) else {
            completion(.failure(unknownError.asAnyError))
            return
        }
        if let response = try? encodedResponse.map(AuthenticationResponse.self) {
            completion(.success(response))
        } else {
            completion(.failure(unknownError.asAnyError))
        }
    }
}

extension AuthenticationRemoteDataSource: AppData.AuthenticationRemoteDataSourceProtocol {

    public func authentication(credentials: Credentials, completion: @escaping GenericCompletion<AuthenticationResponse>) {
        dispacher.call(endpoint: AuthenticationTarget.signIn(credentials)) { [weak self] (result) in
            guard let self = self else { return }
            
            switch result {
            case .success(let response):
                self.handle(response: response, completion: completion)
            case .failure(let error):
                completion(.failure(AnyError(error)))
            }
        }
    }
}
