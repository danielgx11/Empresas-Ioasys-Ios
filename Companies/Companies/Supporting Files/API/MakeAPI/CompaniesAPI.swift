//
//  EmpresasAPI.swift
//  Empresas Ios
//
//  Created by Daniel G on 14/12/19.
//  Copyright © 2019 danielgomes. All rights reserved.
//

import Foundation

class CompaniesAPI: APIRequest {
    
    @discardableResult
    
    static func getCompanies(enterprise_name: String, callback:ResponseBlock<[Companies]>?) ->CompaniesAPI{
            
            let request = CompaniesAPI(method: .get, path: "enterprises?&name="+enterprise_name, parameters: nil, urlParameters: nil, cacheOption: .networkOnly) { (response, error, cache) in
                
                if let error = error {
                    print(error.responseObject ?? "nil")
                } else if let response = response as? [String: Any], let enterprisesJSON = response["enterprises"] as? [ [String: Any] ] {
                    var enterprises = [Companies]()
                    
                    for dic in enterprisesJSON {
                        let enterprise = Companies(dictionary: dic)
                        enterprises.append(enterprise)
                    }
                    callback?(enterprises, nil, cache)
                }
            }
            request.shouldSaveInCache = false
            
            request.makeRequest()
            return request
    }
}
