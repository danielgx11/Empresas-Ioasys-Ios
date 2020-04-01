//
//  CompaniesCoordinator.swift
//  Empresas Ios
//
//  Created by Daniel Gx on 01/04/20.
//  Copyright © 2020 danielgomes. All rights reserved.
//

import UIKit

class CompaniesCoordinator: Coordinator {
    
    // MARK: - Variables
    
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    weak var parentCoordinator: MainCoordinator?
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    // MARK: - Funcs
    
    func start() {
        let vc = CompaniesViewController.instantiate()
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: false)
    }
    
    func didFinishCompanies() {
        parentCoordinator?.childDidFinish(self)
    }
}
