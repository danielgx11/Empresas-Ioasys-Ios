//
//  DetailFlowAssembly.swift
//  Companies
//
//  Created by Daniel Gx on 30/09/20.
//  Copyright © 2020 Daniel Gx. All rights reserved.
//

import Swinject


class DetailFlowAssembly: Assembly {
    
    func assemble(container: Container) {
        let detailCoordinator = container.resolveSafe(DetailCoordinator.self)
        
        
        // MARK: Detail Scene
        container.register(DetailSceneCoordinating.self) { _ in detailCoordinator }
        container.autoregister(DetailPresenting.self, initializer: DetailPresenter.init)
    }
}
