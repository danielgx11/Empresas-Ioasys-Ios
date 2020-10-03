//
//  LoginFactory.swift
//  Companies
//
//  Created by Daniel Gx on 23/09/20.
//  Copyright © 2020 Daniel Gx. All rights reserved.
//

import Foundation


protocol LoginFactory: DependencyFactory { func makeLoginViewController() -> LoginViewController }
