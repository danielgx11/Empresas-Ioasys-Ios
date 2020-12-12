//
//  Authentication+Extension.swift
//  Networking
//
//  Created by Daniel Gomes on 12/12/20.
//

import Domain

extension AuthenticationResponse {
    
    static var fakeData: Data {
        """
            {
            "investor": {
                "id": 1,
                "investor_name": "Fake Investor",
                "email": "fake@gmail.com",
                "city": "BH",
                "country": "Brasil",
                "balance": 1000000.0,
                "photo": null,
                "portfolio": {
                    "enterprises_number": 0,
                    "enterprises": []
                },
                "portfolio_value": 1000000.0,
                "first_access": false,
                "super_angel": false
            },
            "enterprise": null,
            "success": true
            }
            """.data(using: .utf8).defaultValue
    }
}
