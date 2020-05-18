//
//  FavoritesCoordinator.swift
//  Empresas Ios
//
//  Created by Daniel Gx on 13/04/20.
//  Copyright © 2020 danielgomes. All rights reserved.
//

import UIKit

protocol FavoritesFlow: class {
    func goToCompaniesDetail()
}

class FavoritesCoordinator: Coordinator, FavoritesFlow {
    
    // MARK: - Properties
    
    let navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let favoritesTableView = FavoritesTableView()
        favoritesTableView.coordinator = self
        navigationController.pushViewController(favoritesTableView, animated: true)
    }
    
    // MARK: - Flow Methods
    
    func goToCompaniesDetail() {
        //TODO: - Go to selectedEnterprise detail
    }
}
