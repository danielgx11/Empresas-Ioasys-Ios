//
//  CoordinatorFactoryAssembly.swift
//  Companies
//
//  Created by Daniel Gx on 23/09/20.
//  Copyright © 2020 Daniel Gx. All rights reserved.
//

import Swinject


class CoordinatorFactoryAssembly: Assembly {
    
    func assemble(container: Container) {
        container.register(CoordinatorFactory.self) { resolver in CoordinatorFactoryImplementation(resolver: resolver) }
    }
}
