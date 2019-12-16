//
//  User.swift
//  Empresas Ios
//
//  Created by Daniel G on 13/12/19.
//  Copyright © 2019 danielgomes. All rights reserved.
//

import Foundation


struct user: Mappable{
    
    var id: String
    var login: String
    var password: String
    
    init(mapper: Mapper) {
        self.id = mapper.keyPath("id")
        self.login = mapper.keyPath("login")
        self.password = mapper.keyPath("password")
        
    }
}
