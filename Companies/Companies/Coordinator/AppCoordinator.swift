//
//  AppCoordinator.swift
//  Companies
//
//  Created by Daniel Gx on 18/05/20.
//  Copyright © 2020 Daniel Gx. All rights reserved.
//

import UIKit

class AppCoordinator: Coordinator {
    
    
    // MARK: - Properties
    private let coordinatorFactory: CoordinatorFactory!
    let navigationController: UINavigationController
    
    public init(navigationController: UINavigationController, coordinatorFactory: CoordinatorFactory) {
        self.coordinatorFactory = coordinatorFactory
        self.navigationController = navigationController
    }

    func start() {
        let loginCoordinator = coordinatorFactory?.makeLoginCoordinator()
        coordinate(to: loginCoordinator!)
    }
}


// MARK: - LoginCoordinatorDelegate
extension AppCoordinator: LoginCoordinatorDelegate {
    
    func didAuthenticate() {
        let companiesCoordinator = coordinatorFactory.makeCompaniesCoordinator()
        coordinate(to: companiesCoordinator)
    }
}


// MARK: - CompaniesCoordinatorDelegate
extension AppCoordinator: CompaniesCoordinatorDelegate {
    
    func didSelectEnterprise(_ enterprise: Companies) {
        let detailCoordinator = coordinatorFactory.makeDetailCoordinator()
        detailCoordinator.selectedCompany = enterprise
        coordinate(to: detailCoordinator)
    }
}
