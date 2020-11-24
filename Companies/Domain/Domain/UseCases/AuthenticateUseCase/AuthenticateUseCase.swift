//
//  AuthenticateUseCase.swift
//  Domain
//
//  Created by Daniel Gomes on 24/10/20.
//

public class AuthenticateUseCase {
    
    private let authenticationRepository: AuthenticationRepositoryProtocol

    public init(authenticationRepository: AuthenticationRepositoryProtocol) {
        self.authenticationRepository = authenticationRepository
    }
}

extension AuthenticateUseCase: AuthenticateUseCaseProtocol {
    
    public func execute(_ form: LoginForm, completion: @escaping GenericCompletion<AuthenticationResponse>) {
        authenticationRepository.login(form, completion: completion)
    }
}
