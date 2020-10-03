//
//  ProfileCoordinator.swift
//  Empresas Ios
//
//  Created by Daniel Gx on 14/04/20.
//  Copyright © 2020 danielgomes. All rights reserved.
//

import UIKit

protocol ProfileFlow: class {
    func coordinateToLogoutUser()
}

class ProfileCoordinator: Coordinator, ProfileFlow {
    
    // MARK: - Properties
    
    let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let profileTableView = ProfileTableView()
        profileTableView.coordinator = self
        navigationController.pushViewController(profileTableView, animated: false)
    }
    
    // MARK: - Flow Methods
    
    func coordinateToLogoutUser() {
        let loginCoordinator = LoginCoordinator(navigationController: navigationController)
        coordinate(to: loginCoordinator)
    }
}
