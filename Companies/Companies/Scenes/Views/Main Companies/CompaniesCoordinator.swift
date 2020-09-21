//
//  CompaniesCoordinator.swift
//  Companies
//
//  Created by Daniel Gx on 19/05/20.
//  Copyright © 2020 Daniel Gx. All rights reserved.
//

import UIKit


class CompaniesCoordinator: Coordinator {
    
    
    // MARK: - Properties
    let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let companiesPresenter = CompaniesPresenter(withCoordinator: self)
        let companiesViewController = CompaniesViewController(presenter: companiesPresenter)
        companiesPresenter.attach(companiesViewController)
        navigationController.pushViewController(companiesViewController, animated: false)
    }
    
    
    // MARK: - Flow Methods
    func coordinateToCompanyDetail(company: Companies) {
        let detailCoordinator = DetailCoordinator(navigationController: navigationController, selectedCompany: company)
        coordinate(to: detailCoordinator)
    }
}


// MARK: - SceneCoordinating
extension CompaniesCoordinator: CompaniesSceneCoordinating {
    func showCompanyDetail(company: Companies) {
        coordinateToCompanyDetail(company: company)
    }
}
