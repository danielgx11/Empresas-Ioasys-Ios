//
//  AuthenticationTarget.swift
//  Networking
//
//  Created by Daniel Gomes on 12/12/20.
//

import Moya
import OxeNetworking
import Domain

enum AuthenticationTarget {

    case signIn(Credentials)
}

extension AuthenticationTarget: CompaniesTargetProduction {
    
    var version: String { "v1" }
    
    var path: String {
        "\(version)/users/auth/sign_in"
    }
    
    var method: Moya.Method {
        .post
    }
    
    var sampleData: Data {
        AuthenticationResponse.fakeData
    }
    
    var task: Task {
        switch self {
        case .signIn(let credentials):
            return .requestJSONEncodable(credentials)
        }
    }
}
