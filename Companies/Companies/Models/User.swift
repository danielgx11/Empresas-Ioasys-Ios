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
        let userDefaults = UserDefaults.standard
        
        let id = userDefaults.value(forKey: User.current_id) as? String
        let email = userDefaults.value(forKey: User.current_email) as? String
        let token = userDefaults.value(forKey: User.current_token) as? String
        
        self.id = id
        self.email = email
        self.token = token
    }
    
    static func toSave(email: String?, id: String?, token: String?) {
        let userDefaults = UserDefaults.standard
        
        User.current?.id = id
        User.current?.email = email
        User.current?.token = token
        
        userDefaults.set(id, forKey: User.current_id)
        userDefaults.set(email, forKey: User.current_email)
        userDefaults.set(token, forKey: User.current_token)
    }
}
