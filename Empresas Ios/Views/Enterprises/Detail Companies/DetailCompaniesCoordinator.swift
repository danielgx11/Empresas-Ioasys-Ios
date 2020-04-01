//
//  DetailCompaniesCoordinator.swift
//  Empresas Ios
//
//  Created by Daniel Gx on 01/04/20.
//  Copyright © 2020 danielgomes. All rights reserved.
//

import UIKit

class DetailCompaniesCoordinator: Coordinator {
    
    // MARK: - Variables
    
    weak var parentCoordinator: MainCoordinator?
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    var selectedCompany: Companies!
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    // MARK: - Funcs
    
    func start() {
        let vc = DetailCompanyViewController.instantiate()
        vc.selectEnterprise = selectedCompany
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: false)
    }
    
    func didFinishDetailCompanies() {
        parentCoordinator?.childDidFinish(self)
    }
}
