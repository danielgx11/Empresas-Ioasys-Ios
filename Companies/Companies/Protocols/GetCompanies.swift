//
//  GetCompanies.swift
//  Companies
//
//  Created by Daniel Gx on 30/05/20.
//  Copyright © 2020 Daniel Gx. All rights reserved.
//

import UIKit
import Moya

protocol GetCompanies { }

extension GetCompanies {
    
    func getCompanies(target: TargetType, completionHandler: @escaping (Enterprises?, String?) -> Void) {
        let provider = MoyaProvider<Session>()
        var enterprises: Enterprises?
        var error: String?
        
        guard let target = target as? Session else { return }
        
        provider.request(target, completion: { (result) in
            
            switch result {
            case .success(let response):
                guard 200...299 ~= response.statusCode else {
                    do {
                        let decodedError = try JSONDecoder().decode(ResponseError.self, from: response.data)
                        error = decodedError.errors.first ?? "Unknown error"
                        
                    } catch let catchError {
                        error = catchError.localizedDescription
                    }
                    return
                }
                
                do {
                    enterprises = try JSONDecoder().decode(Enterprises.self, from: response.data)
                    completionHandler(enterprises, nil)
                } catch let catchError {
                    error = catchError.localizedDescription
                }
            case .failure(let failureError):
                error = failureError.errorDescription ?? "Unknown error"
            }
        })
        if error != nil {
            completionHandler(nil, error)
        }
    }
}
  
