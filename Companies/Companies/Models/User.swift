//
//  User.swift
//  Companies
//
//  Created by Daniel Gx on 18/05/20.
//  Copyright © 2020 Daniel Gx. All rights reserved.
//

import Foundation

class User {
    
    static var current: User? = User()
    
    var id: String?
    var email: String?
    var token: String?
    
    private static let current_id = "CURRENT_SESSION_ID"
    private static let current_token = "CURRENT_SESSION_TOKEN"
    private static let current_email = "CURRENT_SESSION_EMAIL"
    
    private init?() {
        guard
            let id = KeychainWrapper.standard.string(forKey: User.current_id),
            let email = KeychainWrapper.standard.string(forKey: User.current_email),
            let token = KeychainWrapper.standard.string(forKey: User.current_token)
            else { return }
        
        self.id = id
        self.email = email
        self.token = token
    }
    
    static func toSave(email: String?, id: String?, token: String?) {
        User.current?.id = id
        User.current?.email = email
        User.current?.token = token
        
        KeychainWrapper.standard.set(id ?? "", forKey: User.current_id)
        KeychainWrapper.standard.set(email ?? "", forKey: User.current_email)
        KeychainWrapper.standard.set(token ?? "", forKey: User.current_token)
    }
}
