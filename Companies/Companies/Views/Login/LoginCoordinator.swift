//
//  LoginCoordinator.swift
//  Companies
//
//  Created by Daniel Gx on 18/05/20.
//  Copyright © 2020 Daniel Gx. All rights reserved.
//

import UIKit

protocol LoginFlow: class {
    func coordinateToCompaniesView()
}

class LoginCoordinator: Coordinator, LoginFlow {
    
    
    // MARK: - Properties
    
    let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let loginView = LoginView.initFromStoryboard()
        loginView.coordinator = self
        navigationController.pushViewController(loginView, animated: true)
    }
    
    
    // MARK: - Flow Methods
    
    func coordinateToCompaniesView() {
        let companiesCoordinator = CompaniesCoordinator(navigationController: navigationController)
        coordinate(to: companiesCoordinator)
    }
}
