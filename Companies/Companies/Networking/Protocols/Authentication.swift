//
//  Authentication.swift
//  Companies
//
//  Created by Daniel Gx on 28/05/20.
//  Copyright © 2020 Daniel Gx. All rights reserved.
//

import UIKit
import Moya

protocol Authentication { }
    
extension Authentication {
    
    func doLogin(withCredentials bodyParameters: [String: Any], completionHandler: @escaping (String?) -> Void) {
        let provider = MoyaProvider<Session>()
        
        provider.request(.login(bodyParameters: bodyParameters)) { (result) in
            
            switch result {
            case .success(let response):
                guard 200...299 ~= response.statusCode else {
                    do {
                        let error = try JSONDecoder().decode(ResponseError.self, from: response.data)
                        completionHandler(error.errors.first ?? "Unknown")
                    } catch let error {
                        completionHandler(error.localizedDescription)
                    }
                    return
                }
                self.retrieveAndSaveHeaders(response)
                completionHandler(nil)
            case .failure(let error):
                completionHandler(error.localizedDescription)
            }
        }
    }
    
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
