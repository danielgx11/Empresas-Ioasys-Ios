//
//  CompaniesFactoryImplementation.swift
//  Companies
//
//  Created by Daniel Gx on 29/09/20.
//  Copyright © 2020 Daniel Gx. All rights reserved.
//

import Swinject


class CompaniesFactoryImplementation: CompaniesFactory {
    
    private let resolver: Resolver
    
    required init(resolver: Resolver) {
        self.resolver = resolver
    }
    
    func makeCompaniesViewController() -> CompaniesViewController {
        guard let presenter = resolver.resolveSafe(CompaniesPresenting.self) as? CompaniesPresenter else { preconditionFailure("Couldn't resolve") }
        
        let companiesViewController = CompaniesViewController(presenter: presenter)
        presenter.attach(companiesViewController)
        
        return companiesViewController
    }
}
