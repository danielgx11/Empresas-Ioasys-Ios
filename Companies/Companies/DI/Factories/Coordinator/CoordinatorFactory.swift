//
//  CoordinatorFactory.swift
//  Companies
//
//  Created by Daniel Gx on 23/09/20.
//  Copyright © 2020 Daniel Gx. All rights reserved.
//

protocol CoordinatorFactory: DependencyFactory {
    
    func makeLoginCoordinator() -> LoginCoordinator
    func makeCompaniesCoordinator() -> CompaniesCoordinator
    func makeDetailCoordinator() -> DetailCoordinator
}
