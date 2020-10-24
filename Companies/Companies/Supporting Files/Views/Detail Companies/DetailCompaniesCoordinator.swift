//
//  DetailCompaniesCoordinator.swift
//  Empresas Ios
//
//  Created by Daniel Gx on 01/04/20.
//  Copyright © 2020 danielgomes. All rights reserved.
//

import UIKit

protocol DetailCompaniesFlow {
    func dismissDetailCompanies()
}

class DetailCompaniesCoordinator: Coordinator, DetailCompaniesFlow {
    
    // MARK: - Properties
    
    var navigationController: UINavigationController
    var selectedCompany: Companies!
    
    init(navigationController: UINavigationController, selectedCompany: Companies) {
        self.navigationController = navigationController
        self.selectedCompany = selectedCompany
    }
    
    func start() {
        let detailCompaniesViewController = DetailCompanyViewController.initFromStoryboard()
        detailCompaniesViewController.selectEnterprise = selectedCompany
        detailCompaniesViewController.coordinator = self
        navigationController.pushViewController(detailCompaniesViewController, animated: false)
    }
    
    // MARK: - Flow Methods
    
    func dismissDetailCompanies() {
        let listCompaniesCoordinator = ListCompaniesCoordinator(navigationController: navigationController)
        coordinate(to: listCompaniesCoordinator)
    }
}
