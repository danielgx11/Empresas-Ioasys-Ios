//
//  LoginFlowAssembly.swift
//  Companies
//
//  Created by Daniel Gx on 23/09/20.
//  Copyright © 2020 Daniel Gx. All rights reserved.
//

import Swinject


class LoginFlowAssembly: Assembly {
    
    func assemble(container: Container) {
        let loginCoordinator = container.resolveSafe(LoginCoordinator.self)
        
        
        // MARK: - LoginScene
        container.register(LoginSceneCoordinating.self) { _ in loginCoordinator }
        container.autoregister(LoginPresenting.self, initializer: LoginPresenter.init)
    }
}
