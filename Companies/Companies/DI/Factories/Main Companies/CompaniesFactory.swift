//
//  MainCompaniesFactory.swift
//  Companies
//
//  Created by Daniel Gx on 29/09/20.
//  Copyright © 2020 Daniel Gx. All rights reserved.
//

import Foundation

protocol CompaniesFactory: DependencyFactory { func makeCompaniesViewController() -> CompaniesViewController }
