//
//  KeychainStorage.swift
//  Storage
//
//  Created by Daniel Gomes on 12/12/20.
//

import Foundation
import KeychainAccess

public class KeychainStorage: KeychainStoring {
    
    public var service: String?
    public var accessGroup: String?
    
    public init(service: String? = nil, accessGroup: String? = nil) {
        self.service = service
        self.accessGroup = accessGroup
    }

    public enum ValueKeyable: String, Keyable, CaseIterable {

        // Login
        case authentication
        case credentials

        public var key: String {
            return rawValue
        }
    }
}
