//
//  LoginCoordinator.swift
//  Empresas Ios
//
//  Created by Daniel Gx on 08/04/20.
//  Copyright © 2020 danielgomes. All rights reserved.
//

import UIKit

protocol LoginFlow: class {
    func coordinateToTabBar()
}

class LoginCoordinator: Coordinator, LoginFlow {
    
    // MARK: - Properties
    
    let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let loginViewController = LoginViewController.initFromStoryboard(name: "Main")
        loginViewController.coordinator = self
        navigationController.pushViewController(loginViewController, animated: true)
    }
    
    // MARK: - Flow Methods
    
    func coordinateToTabBar() {
        let tabBarCoordinator = TabBarCoordinator(navigationController: navigationController)
        coordinate(to: tabBarCoordinator)
    }
}
