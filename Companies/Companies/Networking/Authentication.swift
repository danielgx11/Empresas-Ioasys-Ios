//
//  Authentication.swift
//  Companies
//
//  Created by Daniel Gx on 28/05/20.
//  Copyright © 2020 Daniel Gx. All rights reserved.
//

import UIKit
import Moya

class Authentication {
    
    // MARK: - Properties
    
    static var shared: Authentication? = Authentication()
    
    // MARK: - Methods
    
    func retrieveAndSaveHeaders<O: Response>(_ response: O) {
        guard let response = response.response else { return }
        let responsable = response.allHeaderFields
        
        guard
            let accessToken = responsable["access-token"] as? String,
            let uid = responsable["uid"] as? String,
            let client = responsable["client"] as? String else  { return }
        
        saveCurrentHeaders(accessToken: accessToken, uid: uid, client: client)
    }
    
    func saveCurrentHeaders(accessToken: String, uid: String, client: String) {
        User.toSave(email: uid, id: client, token: accessToken)
    }
}
