//
//  CompaniesCoordinator.swift
//  Companies
//
//  Created by Daniel Gx on 19/05/20.
//  Copyright © 2020 Daniel Gx. All rights reserved.
//

import UIKit

protocol CompaniesCoordinatorDelegate: AnyObject {
    func didSelectEnterprise(_ enterprise: Companies)
}


class CompaniesCoordinator: Coordinator {
    
    
    // MARK: - Properties
    private let companiesFactory: CompaniesFactory
    let navigationController: UINavigationController
    weak var coordinatorDelegate: CompaniesCoordinatorDelegate?
    
    public init(navigationController: UINavigationController, companiesFactory: CompaniesFactory, coordinatorDelegate: CompaniesCoordinatorDelegate) {
        self.navigationController = navigationController
        self.companiesFactory = companiesFactory
        self.coordinatorDelegate = coordinatorDelegate
    }
    
    func start() {
        let companiesViewController = companiesFactory.makeCompaniesViewController()
        navigationController.pushViewController(companiesViewController, animated: false)
    }
}


// MARK: - SceneCoordinating
extension CompaniesCoordinator: CompaniesSceneCoordinating {
    
    func showCompanyDetail(company: Companies) {
        coordinatorDelegate?.didSelectEnterprise(company)
    }
}


// MARK: - LoginCoordinatorDelegate
extension CompaniesCoordinator: LoginCoordinatorDelegate {
    
    func didAuthenticate() {
        start()
    }
}
