//
//  CompaniesCoordinator.swift
//  Empresas Ios
//
//  Created by Daniel Gx on 01/04/20.
//  Copyright © 2020 danielgomes. All rights reserved.
//

import UIKit

protocol CompaniesFlow {
    func coordinateToListOfCompanies()
}

class CompaniesCoordinator: Coordinator, CompaniesFlow {
    
    // MARK: - Variables
    
    let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
        
    func start() {
        let vc = CompaniesViewController.initFromStoryboard()
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: false)
    }
    
    // MARK: - Flow Methods
    
    func coordinateToListOfCompanies() {
        let listCompaniesCoordinator = ListCompaniesCoordinator(navigationController: navigationController)
        coordinate(to: listCompaniesCoordinator)
    }
}
