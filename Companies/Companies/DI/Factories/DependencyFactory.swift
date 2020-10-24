//
//  DependencyFactory.swift
//  Companies
//
//  Created by Daniel Gx on 23/09/20.
//  Copyright © 2020 Daniel Gx. All rights reserved.
//

import Swinject


protocol DependencyFactory: AnyObject { init(resolver: Resolver) }
