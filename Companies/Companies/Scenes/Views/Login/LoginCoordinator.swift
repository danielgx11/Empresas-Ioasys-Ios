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
        let loginPresenter = LoginPresenter(withCoordinator: self)
        let loginViewController = LoginViewController(presenter: loginPresenter)
        loginPresenter.attach(loginViewController)
        loginViewController.coordinator = self
        navigationController.pushViewController(loginViewController, animated: true)
    }
    
    
    // MARK: - Flow Methods
    func coordinateToCompaniesView() {
        let companiesCoordinator = CompaniesCoordinator(navigationController: navigationController)
        coordinate(to: companiesCoordinator)
    }
}

extension LoginCoordinator: LoginSceneCoordinating {
    func showCompaniesView() {
        coordinateToCompaniesView()
    }
}
