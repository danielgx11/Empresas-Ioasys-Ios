//
//  LoginCoordinator.swift
//  Companies
//
//  Created by Daniel Gx on 18/05/20.
//  Copyright © 2020 Daniel Gx. All rights reserved.
//

import UIKit

protocol LoginCoordinatorDelegate: AnyObject {
    func didAuthenticate()
}

class LoginCoordinator: Coordinator {
    
    
    // MARK: - Properties
    private let loginFactory: LoginFactory
    let navigationController: UINavigationController
    weak var coordinatorDelegate: LoginCoordinatorDelegate?
    
    init(navigationController: UINavigationController, loginFactory: LoginFactory, coordinatorDelegate: LoginCoordinatorDelegate) {
        self.navigationController = navigationController
        self.loginFactory = loginFactory
        self.coordinatorDelegate = coordinatorDelegate
    }
    
    func start() {
        let loginViewController = loginFactory.makeLoginViewController()
        navigationController.pushViewController(loginViewController, animated: true)
    }
}


// MARK: - SceneCoordinating
extension LoginCoordinator: LoginSceneCoordinating {
    func showCompaniesView() {
        coordinatorDelegate?.didAuthenticate()
    }
}
