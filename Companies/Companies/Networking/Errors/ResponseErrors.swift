//
//  ResponseErros.swift
//  Companies
//
//  Created by Daniel Gx on 30/05/20.
//  Copyright © 2020 Daniel Gx. All rights reserved.
//

import Foundation

struct ResponseError: Codable, LocalizedError {
    let errors: [String]
}
