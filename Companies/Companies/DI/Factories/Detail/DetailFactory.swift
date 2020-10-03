//
//  DetailFactory.swift
//  Companies
//
//  Created by Daniel Gx on 30/09/20.
//  Copyright © 2020 Daniel Gx. All rights reserved.
//

import Foundation

protocol DetailFactory: DependencyFactory { func makeDetailViewController() -> DetailViewController }
