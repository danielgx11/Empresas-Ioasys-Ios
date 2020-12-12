//
//  String+Extensions.swift
//  Domain
//
//  Created by Daniel Gomes on 12/12/20.
//

import Commons

public extension String {
    var requestFormat: String {
        return self.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed).defaultValue
    }
}
