//
//  ListCompaniesCoordinator.swift
//  Empresas Ios
//
//  Created by Daniel Gx on 01/04/20.
//  Copyright © 2020 danielgomes. All rights reserved.
//

import UIKit

class ListCompaniesCoordinator: Coordinator {
    
    // MARK: - Variables
    
    weak var parentCoordinator: MainCoordinator?
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    // MARK: - Funcs
    
    func start() {
        let vc = ListCompaniesTableView.instantiate()
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: false)
    }
    
    func didFinishListCompanies() {
        parentCoordinator?.childDidFinish(self)
    }
}
