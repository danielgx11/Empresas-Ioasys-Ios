//
//  ViewControllersFactoryAssembly.swift
//  Companies
//
//  Created by Daniel Gx on 23/09/20.
//  Copyright © 2020 Daniel Gx. All rights reserved.
//

import Swinject


class ViewControllersFactoryAssembly: Assembly {
    
    func assemble(container: Container) {
        container.register(LoginFactory.self) { resolver in LoginFactoryImplementation(resolver: resolver) }
        
        container.register(CompaniesFactory.self) { resolver in CompaniesFactoryImplementation(resolver: resolver) }
        
        container.register(DetailFactory.self) { resolver in DetailFactoryImplementation(resolver: resolver) }
    }
}
