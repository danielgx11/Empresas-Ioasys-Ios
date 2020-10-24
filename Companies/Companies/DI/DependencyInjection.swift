//
//  DependencyInjection.swift
//  Companies
//
//  Created by Daniel Gx on 23/09/20.
//  Copyright © 2020 Daniel Gx. All rights reserved.
//

import UIKit
import Swinject
import SwinjectAutoregistration


class DependencyInjection {
    
    private let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func build(completion: (_ assembler: Assembler, _ appCoordinator: AppCoordinator) -> ()) {
        let assembler = Assembler ([
            CoordinatorFactoryAssembly(),
            ViewControllersFactoryAssembly(),
            CoordinatorAssembly(navigationController: self.navigationController),
            LoginFlowAssembly(),
            CompaniesFlowAssembly(),
            DetailFlowAssembly(),
            DomainAssembly()
        ])
        
        let appCoordinator = assembler.resolver.resolveSafe(AppCoordinator.self)
        completion(assembler, appCoordinator)
    }
}
