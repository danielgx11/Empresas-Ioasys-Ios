//
//  Task+Extension.swift
//  Networking
//
//  Created by Daniel Gomes on 12/12/20.
//

import Moya
import Domain
import OxeNetworking

extension Task {
    
    static func requestPercentParameters(parameters: [String: Any], encoding: ParameterEncoding) -> Task {
        var requestParameters = parameters
        for parameter in requestParameters where parameter.value is String {
            guard let value = parameter.value as? String else { continue }
            
            requestParameters[parameter.key] = value.requestFormat
        }
        return .requestParameters(parameters: requestParameters, encoding: QueryArrayEncoding.default)
    }
}
