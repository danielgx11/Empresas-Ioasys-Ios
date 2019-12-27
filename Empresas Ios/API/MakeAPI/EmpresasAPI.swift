//
//  EmpresasAPI.swift
//  Empresas Ios
//
//  Created by Daniel G on 14/12/19.
//  Copyright © 2019 danielgomes. All rights reserved.
//

import Foundation

class EmpresasAPI: APIRequest {
    
    @discardableResult
    
    static func getCompanies(enterprise_name: String, callback:ResponseBlock<[Empresas]>?) ->EmpresasAPI{
            
            let request = EmpresasAPI(method: .get, path: "enterprises?&name="+enterprise_name, parameters: nil, urlParameters: nil, cacheOption: .networkOnly) { (response, error, cache) in
                
                if let error = error {
                    print(error.responseObject ?? "nil")
                } else if let response = response as? [String: Any], let enterprisesJSON = response["enterprises"] as? [ [String: Any] ] {
                    var enterprises = [Empresas]()
                    
                    for dic in enterprisesJSON {
                        let enterprise = Empresas(dictionary: dic)
                        enterprises.append(enterprise)
                    }
                    callback?(enterprises, nil, cache)
                }
            }
            request.shouldSaveInCache = false
            
            request.makeRequest()
            return request
            
            
            
//            if let error = error {
//                callback?(nil, error, cache)
//            } else if let response = response as? JSONDictionary {
//                if let enterprisesArray = response["enterprises"] as? JSONArray {
//                    let enterprisesMap = enterprisesArray.map {Empresas(dictionary:$0)}
//                    var enterprises: [Empresas] = []
//                    for enterpriseDict in enterprisesArray {
//                        let companie = Empresas(dictionary: enterpriseDict)
//                        enterprises.append(companie)
//                    }
//
//                    callback!(enterprises, nil, cache)
//                }
//            }
//        }
//
//        request.shouldSaveInCache = false
//        request.makeRequest()
//
//        return request
//
//    }
    
}
}
