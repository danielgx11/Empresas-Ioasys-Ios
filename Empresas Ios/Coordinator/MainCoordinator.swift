//
//  MainCoordinator.swift
//  Empresas Ios
//
//  Created by ioasys on 11/12/19.
//  Copyright © 2019 danielgomes. All rights reserved.
//

import UIKit

class MainCoordinator: Coordinator {
    
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController){
        self.navigationController = navigationController
    }
    
    func start() {
        let vc = LoginViewController.instantiate()
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: false)
    }
    
    func companyList (){
        let vc = CompaniesViewController.instantiate()
        vc.coodinator = self
        navigationController.pushViewController(vc, animated: false)
    }
    
    func tableViewList(){
        let vc = ListCompaniesTableView.instantiate()
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: false)
    }
    
    func companyDescriptions(to selectedEnterprise: Companies){
        let vc = DetailCompanyViewController.instantiate()
        vc.selectEnterprise = selectedEnterprise
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: false)
    }
    
}
