//
//  Company.swift
//  Companies
//
//  Created by Daniel Gx on 18/05/20.
//  Copyright © 2020 Daniel Gx. All rights reserved.
//

import Moya

public enum EnterpriseOptions {
    case all
    case filter(name: String)
}

public enum Company {
    static var loginKey = ""
    static var passwordKey = ""
    
    case login
    case enterprise(EnterpriseOptions)
}

extension Company: TargetType {
    public var baseURL: URL {
        return URL(string: "https://empresas.ioasys.com.br/api/v1")!
    }
    
    public var path: String {
        switch self {
        case .login: return "/users/auth/sign_in"
        case .enterprise(let option):
            switch option {
            case .all: return "/enterprises/"
            case .filter: return "/enterprises"
            }
        }
    }
    
    public var method: Moya.Method {
        switch self {
        case .login: return .post
        case .enterprise: return .get
        }
    }
    
    public var sampleData: Data {
        return Data()
    }
    
    public var task: Task {
        switch self {
        case .login:
            return .requestCompositeParameters(bodyParameters: [ "email" : Company.loginKey, "password" : Company.passwordKey ], bodyEncoding: JSONEncoding.default, urlParameters: [:])
        case .enterprise(let option):
            switch option {
            case .all: return .requestPlain
            case .filter(let name): return .requestParameters(parameters: ["name" : name], encoding: URLEncoding.default)
            }
        }
    }
    
    var validate: Bool {
        return false
    }
    
    public var headers: [String : String]? {
        switch self {
        case .login: return ["Content-Type" : "application/json"]
        case .enterprise: return    [
                    "Content-Type" : "application/json",
                    "access-token" : User.current?.token ?? "",
                    "client" : User.current?.id ?? "",
                    "uid" : User.current?.email ?? ""
                                    ]
        }
    }
    
    public var validationType: ValidationType {
        return .successCodes
    }
}
