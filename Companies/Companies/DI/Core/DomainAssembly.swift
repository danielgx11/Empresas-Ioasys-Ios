//
//  DomainAssembly.swift
//  Companies
//
//  Created by Daniel Gomes on 24/10/20.
//  Copyright © 2020 Daniel Gx. All rights reserved.
//

import Swinject
import Domain

class DomainAssembly: Assembly {
    
    func assemble(container: Container) {
        
        container.register(Domain.LoginFormValidateUseCaseProtocol.self) { _ in LoginFormValidateUseCase() }
    }
}
