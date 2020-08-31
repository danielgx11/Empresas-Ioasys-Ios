//
//  CompaniesCoordinator.swift
//  Companies
//
//  Created by Daniel Gx on 19/05/20.
//  Copyright © 2020 Daniel Gx. All rights reserved.
//

import UIKit

protocol CompaniesFlow: class {
    func coordinateToCompanyDetail(company: Companies)
}

class CompaniesCoordinator: Coordinator, CompaniesFlow {
    
    
    // MARK: - Properties
    let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let companiesViewController = CompaniesViewController()
        companiesViewController.coordinator = self
        navigationController.pushViewController(companiesViewController, animated: false)
    }
    
    
    // MARK: - Flow Methods
    func coordinateToCompanyDetail(company: Companies) {
        let detailCoordinator = DetailCoordinator(navigationController: navigationController, selectedCompany: company)
        coordinate(to: detailCoordinator)
    }
}
