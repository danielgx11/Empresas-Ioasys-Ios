//
//  CompaniesTargetProtocol.swift
//  Networking
//
//  Created by Daniel Gomes on 12/12/20.
//

import Moya
import OxeNetworking

public protocol CompaniesTargetProtocol: SampleHeadersReturning, HigherLayerHeadersSpecifyable, KeyPathable {
    var version: String { get }
}
public protocol CompaniesTargetProduction: CompaniesTargetProtocol { }

extension CompaniesTargetProtocol {
    public var specificHeaderTypes: [HeaderSpecifying] { [] }
    public var keyPathForData: String? { nil }
    public var validationType: ValidationType { .successAndRedirectCodes }
    public var headers: [String : String]? { Constants.commomHeaders }
}

extension CompaniesTargetProtocol where Self: CompaniesTargetProduction {
    public var baseURL: URL { URL(string: "https://empresas.ioasys.com.br/api")! }
}
