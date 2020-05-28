//
//  CompaniesCoordinator.swift
//  Companies
//
//  Created by Daniel Gx on 19/05/20.
//  Copyright © 2020 Daniel Gx. All rights reserved.
//

import UIKit

protocol CompaniesFlow: class {
    //
}

class CompaniesCoordinator: Coordinator, CompaniesFlow {
    
    // MARK: - Properties
    
    let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let companiesView = CompaniesView()
        companiesView.coordinator = self
        navigationController.pushViewController(companiesView, animated: false)
    }
    
    // MARK: - Flow Methods
}
