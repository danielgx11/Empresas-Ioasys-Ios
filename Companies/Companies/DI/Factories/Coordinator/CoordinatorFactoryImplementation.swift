//
//  CoordinatorFactoryImplementation.swift
//  Companies
//
//  Created by Daniel Gx on 23/09/20.
//  Copyright © 2020 Daniel Gx. All rights reserved.
//

import Swinject


class CoordinatorFactoryImplementation: CoordinatorFactory {
    
    private let resolver: Resolver
    
    required init(resolver: Resolver) {
        self.resolver = resolver
    }
    
    func makeLoginCoordinator() -> LoginCoordinator { resolver.resolveSafe(LoginCoordinator.self) }
    
    func makeCompaniesCoordinator() -> CompaniesCoordinator { resolver.resolveSafe(CompaniesCoordinator.self) }
    
    func makeDetailCoordinator() -> DetailCoordinator { resolver.resolveSafe(DetailCoordinator.self) }
}
