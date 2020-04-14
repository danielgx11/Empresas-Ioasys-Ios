//
//  ListCompaniesCoordinator.swift
//  Empresas Ios
//
//  Created by Daniel Gx on 01/04/20.
//  Copyright © 2020 danielgomes. All rights reserved.
//

import UIKit

protocol ListCompaniesFlow {
    func coordinateToCompanyDetail(to selectedEnterprise: Companies)
    func coordinateToCancelSearch()
}

class ListCompaniesCoordinator: Coordinator, ListCompaniesFlow {
    
    // MARK: - Properties
    
    let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let listCompaniesTableView = ListCompaniesTableView.initFromStoryboard()
        listCompaniesTableView.coordinator = self
        navigationController.pushViewController(listCompaniesTableView, animated: false)
    }
    
    // MARK: - Flow Methods
    
    func coordinateToCompanyDetail(to selectedEnterprise: Companies) {
        let detailCompaniesCoordinator = DetailCompaniesCoordinator(navigationController: navigationController, selectedCompany: selectedEnterprise)
        coordinate(to: detailCompaniesCoordinator)
    }
    
    func coordinateToCancelSearch() {
        let tabBarCoordinator = TabBarCoordinator(navigationController: navigationController)
        coordinate(to: tabBarCoordinator)
    }
    
}
