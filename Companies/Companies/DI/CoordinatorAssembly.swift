//
//  CoordinatorAssembly.swift
//  Companies
//
//  Created by Daniel Gx on 23/09/20.
//  Copyright © 2020 Daniel Gx. All rights reserved.
//

import Swinject

class CoordinatorAssembly: Assembly {
    
    private let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func assemble(container: Container) {
        guard let coordinatorFactory = container.resolve(CoordinatorFactory.self) else { return }
        
        
        // MARK: - AppCoordinator
        container.register(AppCoordinator.self) { resolver in
            let appCoordinator = AppCoordinator(navigationController: self.navigationController, coordinatorFactory: coordinatorFactory)
            return appCoordinator
        }
        
        let appCoordinator = container.resolveSafe(AppCoordinator.self)
        
        
        // MARK: - LoginCoordinator
        container.register(LoginCoordinator.self) { resolver in
            let loginFactory = resolver.resolveSafe(LoginFactory.self)
            let loginCoordinator = LoginCoordinator(navigationController: self.navigationController, loginFactory: loginFactory, coordinatorDelegate: appCoordinator)
            return loginCoordinator
        }
        
        
        // MARK: - CompaniesCoordinator
        container.register(CompaniesCoordinator.self) { resolver in
            let companiesFactory = resolver.resolveSafe(CompaniesFactory.self)
            let companiesCoordinator = CompaniesCoordinator(navigationController: self.navigationController, companiesFactory: companiesFactory, coordinatorDelegate: appCoordinator)
            return companiesCoordinator
        }
                
        
        // MARK: - DetailCoordinator
        container.register(DetailCoordinator.self) { resolver in
            let detailFactory = resolver.resolveSafe(DetailFactory.self)
            let detailCoordinator = DetailCoordinator(navigationController: self.navigationController, detailFactory: detailFactory)
            return detailCoordinator
        }
    }
}
