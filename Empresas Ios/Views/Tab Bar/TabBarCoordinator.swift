//
//  TabBarCoordinator.swift
//  Empresas Ios
//
//  Created by Daniel Gx on 09/04/20.
//  Copyright © 2020 danielgomes. All rights reserved.
//

import UIKit

class TabBarCoordinator: Coordinator {
    
    // MARK: - Properties
    
    let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let tabBarController = TabBarController()
        tabBarController.coordinator = self
        
        let companiesNavigationController = UINavigationController()
        companiesNavigationController.tabBarItem = UITabBarItem(tabBarSystemItem: .search, tag: 0)
        let companiesCoordinator = CompaniesCoordinator(navigationController: companiesNavigationController)
        
        let favoritesNavigationController = UINavigationController()
        favoritesNavigationController.tabBarItem = UITabBarItem(tabBarSystemItem: .favorites, tag: 1)
        let favoritesCoordinator = FavoritesCoordinator(navigationController: favoritesNavigationController)
        
        let profileNavigationController = UINavigationController()
        profileNavigationController.tabBarItem = UITabBarItem(tabBarSystemItem: .contacts, tag: 2)
        let profileCoordinator = ProfileCoordinator(navigationController: profileNavigationController)
        
        tabBarController.viewControllers = [companiesNavigationController, favoritesNavigationController, profileNavigationController]
        
        tabBarController.modalPresentationStyle = .fullScreen
        navigationController.present(tabBarController, animated: false, completion: nil)
        
        coordinate(to: companiesCoordinator)
        coordinate(to: favoritesCoordinator)
        coordinate(to: profileCoordinator)
    }
}
