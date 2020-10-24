//
//  LoginFactoryImplementation.swift
//  Companies
//
//  Created by Daniel Gx on 28/09/20.
//  Copyright © 2020 Daniel Gx. All rights reserved.
//

import Swinject


class LoginFactoryImplementation: LoginFactory {
    
    private let resolver: Resolver
    
    required init(resolver: Resolver) {
        self.resolver = resolver
    }
    
    func makeLoginViewController() -> LoginViewController {
        guard let presenter = resolver.resolve(LoginPresenting.self) as? LoginPresenter else {
            preconditionFailure("LoginPresenting is nil")
        }
        
        let loginViewController = LoginViewController(presenter: presenter)
        presenter.attach(loginViewController)
        return loginViewController
    }
}
