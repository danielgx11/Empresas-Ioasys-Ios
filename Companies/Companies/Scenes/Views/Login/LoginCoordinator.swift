//
//  LoginCoordinator.swift
//  Companies
//
//  Created by Daniel Gx on 18/05/20.
//  Copyright © 2020 Daniel Gx. All rights reserved.
//

import UIKit


class LoginCoordinator: Coordinator {
    
    
    // MARK: - Properties
    let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let loginPresenter = LoginPresenter(withCoordinator: self)
        let loginViewController = LoginViewController(presenter: loginPresenter)
        loginPresenter.attach(loginViewController)
        navigationController.pushViewController(loginViewController, animated: true)
    }
    
    
    // MARK: - Flow Methods
    func coordinateToCompaniesView() {
        let companiesCoordinator = CompaniesCoordinator(navigationController: navigationController)
        coordinate(to: companiesCoordinator)
    }
}


// MARK: - SceneCoordinating
extension LoginCoordinator: LoginSceneCoordinating {
    func showCompaniesView() {
        coordinateToCompaniesView()
    }
}
