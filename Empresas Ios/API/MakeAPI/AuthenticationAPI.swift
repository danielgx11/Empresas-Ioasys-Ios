//
//  AuthenticationAPI.swift
//  Empresas Ios
//
//  Created by Daniel G on 13/12/19.
//  Copyright © 2019 danielgomes. All rights reserved.
//

import Foundation
import UIKit

struct User: Mappable {
    init(mapper: Mapper) {}
}

class AuthenticationAPI: APIRequest {
    @discardableResult
    static func loginWith(email: String, password: String, callback: ResponseBlock<User>?) -> AuthenticationAPI {
        
        let request = AuthenticationAPI(method: .post, path: "users/auth/sign_in", parameters: ["email": email, "password": password], urlParameters: nil, cacheOption: .networkOnly) { (response, error, cache) in
            if let error = error {
                callback?(nil, error, cache)
            } else if let response = response as? [String: Any] {
                let user = User(dictionary: response)
                callback!(user, nil, cache)
            }
        }
        request.shouldSaveInCache = false
        request.makeRequest()
        
        return request
    }
}


