//
//  Credentials.swift
//  Domain
//
//  Created by Daniel Gomes on 22/11/20.
//

import Foundation

public struct Credentials: Codable {
    
    public var email: String
    public var password: String
    
    public init(email: String, password: String) {
        self.email = email
        self.password = password
    }
    
    enum CodingKeys: String, CodingKey {
        case email, password
    }
}

public extension Credentials {
    
    static func generateFake() -> Credentials {
        Credentials(email: "tests@gmail.com",
                    password: "123456")
    }
}
