//
//  DetailFactoryImplementation.swift
//  Companies
//
//  Created by Daniel Gx on 30/09/20.
//  Copyright © 2020 Daniel Gx. All rights reserved.
//

import Swinject

class DetailFactoryImplementation: DetailFactory {
    
    private let resolver: Resolver
    
    required init(resolver: Resolver) {
        self.resolver = resolver
    }
    
    func makeDetailViewController() -> DetailViewController {
        guard let presenter = resolver.resolveSafe(DetailPresenting.self) as? DetailPresenter else { preconditionFailure("Couldn't resolve") }
        
        let detailViewController = DetailViewController(presenter: presenter)
        presenter.attatch(detailViewController)
        
        return detailViewController
    }
}
