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
        let vc = ViewController.instantiate()
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: false)
    }
    
    func empresasLista (){
        let vc = EmpresasViewController.instantiate()
        vc.coodinator = self
        navigationController.pushViewController(vc, animated: true)
    }
    
    func tableViewList(){
        let vc = ListarEmpresasTableViewController.instantiate()
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: true)
    }
    
    
    func empresasDescricoes(to empresaSelecionada: Empresas){
        let vc = DetalheEmpresaViewController.instantiate()
        vc.selectEnterprise = empresaSelecionada
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: true)
    }
    
}

//extension MainCoordinator: ListarEmpresasTableViewControllerDelegate {
//    
//    func goToDetailsEnterprise(enterprise: Empresas, on viewController: UIViewController) {
//        empresasDescricoes(of: enterprise)
//    }
//}
