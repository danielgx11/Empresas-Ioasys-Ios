//
//  CompaniesFlowAssembly.swift
//  Companies
//
//  Created by Daniel Gx on 30/09/20.
//  Copyright © 2020 Daniel Gx. All rights reserved.
//

import Swinject


class CompaniesFlowAssembly: Assembly {
    
    func assemble(container: Container) {
        let companiesCoordinator = container.resolveSafe(CompaniesCoordinator.self)
        
        
        // MARK: - Companies Scene
        container.register(CompaniesSceneCoordinating.self) { _ in companiesCoordinator }
        container.autoregister(CompaniesPresenting.self, initializer: CompaniesPresenter.init)
    }
}
