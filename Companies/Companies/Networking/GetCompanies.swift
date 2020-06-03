//
//  GetCompanies.swift
//  Companies
//
//  Created by Daniel Gx on 30/05/20.
//  Copyright © 2020 Daniel Gx. All rights reserved.
//

import UIKit
import Moya

class GetCompanies {
    
    // MARK: - Properties
    
    static var shared: GetCompanies? = GetCompanies()
    
    let provider = MoyaProvider<Session>()
    var enterprises: Enterprises?
    var error: String?
    private var decoder = JSONDecoder()
    
    // MARK: - Methods
    
    func getCompanies(target: TargetType, completionHandler: @escaping (Enterprises?, String?) -> Void) {
        guard let target = target as? Session else { return }
        provider.request(target, completion: { [weak self] (result) in
            guard let self = self else { return }
            
            switch result {
            case .success(let response):
                guard 200...299 ~= response.statusCode else {
                    do {
                        let error = try self.decoder.decode(ResponseError.self, from: response.data)
                        self.error = error.errors.first ?? "Unknown error"
                        
                    } catch let error {
                        self.error = error.localizedDescription
                    }
                    return
                }
                
                do {
                    self.enterprises = try JSONDecoder().decode(Enterprises.self, from: response.data)
                    completionHandler(self.enterprises, nil)
                } catch let error {
                    self.error = error.localizedDescription
                }
            case .failure(let error):
                self.error = error.errorDescription ?? "Unknown error"
            }
        })
        if error != nil {
            completionHandler(nil, error)
        }
    }
}
