//
//  CommomMoyaDispatcherMock.swift
//  NetworkingTests
//
//  Created by Daniel Gomes on 12/12/20.
//

import Networking
import OxeNetworking
import Alamofire
import Moya

enum FixturesType: String, FixtureTypeSpecifying {
    case development, json, none
    
    public var isEnabled: Bool { self != .none }
    public var isJsonType: Bool { self == .json }
}

enum EnvironmentType: String, EnvironmentSpecifying {
    case development, production
    
    public var name: String { rawValue }
    public var baseURL: URL? { nil }
    public var mayBeSimulated: Bool { CommonMoyaDispatcherMock.isMockedEnvironment }
}

class CommonMoyaDispatcherMock: CommonMoyaDispatcher {
    
// MARK: - Properties
    
    static var isMockedEnvironment = false
    var isFailedTest = false
    var hasInvalidData = false
    var hasReturnCodeError = false

    convenience init() {
        let environment = Environment(type: EnvironmentType.development, fixturesType: FixturesType.json)
        let userSessionRequestHandler = UserSessionRequestHandler(environment: environment)
        self.init(environment: environment, resultHandler: userSessionRequestHandler,
                  errorFilter: userSessionRequestHandler, interceptor: userSessionRequestHandler)
    }
    
    override func call(endpoint: TargetType, completion: @escaping Completion) {
        
        if isFailedTest {
            completion(.failure(MoyaError.requestMapping("Failed Test")))
        } else if hasInvalidData {
            callInvalidData(endpoint: endpoint, completion: completion)
        } else if hasReturnCodeError {
            callReturnCodeError(endpoint: endpoint, completion: completion)
        } else {
            super.call(endpoint: endpoint, completion: completion)
        }
    }

// MARK: - Methods
    
    private func callInvalidData(endpoint: TargetType, completion: @escaping Completion) {
        let statusCode = 200
        let httpResponse = HTTPURLResponse(url: endpoint.baseURL, statusCode: statusCode, httpVersion: nil,
                                           headerFields: (endpoint as? SampleHeadersReturning)?.sampleHeaders)
        let response = Response(statusCode: statusCode, data: Data(), response: httpResponse)
        completion(.success(response))
    }
    
    private func callReturnCodeError(endpoint: TargetType, completion: @escaping Completion) {
        let data = "{ \"codigoDeRetorno\": 10 }".data(using: .isoLatin1).defaultValue
        let statusCode = 200
        let httpResponse = HTTPURLResponse(url: endpoint.baseURL, statusCode: statusCode, httpVersion: nil,
                                           headerFields: (endpoint as? SampleHeadersReturning)?.sampleHeaders)
        let response = Response(statusCode: statusCode, data: data, response: httpResponse)
        completion(.success(response))
    }
}
