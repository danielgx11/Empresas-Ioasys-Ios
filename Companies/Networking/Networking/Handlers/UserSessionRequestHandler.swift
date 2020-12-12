//
//  UserSessionRequestHandler.swift
//  Networking
//
//  Created by Daniel Gomes on 12/12/20.
//

import Moya
import Alamofire
import SwiftyJSON
import Domain
import AppData
import OxeNetworking

public protocol SessionRequestHandler: ResultHandler, ErrorFilter, RequestInterceptor {}

public class UserSessionRequestHandler: SessionRequestHandler {

    public var environment: Environment
    private let lock = NSLock()
    private var isRefreshing = false
    private var requestsToRetry: [(RetryResult) -> Void] = []
    private var retryCount: Int = 0

    private lazy var session: Alamofire.Session = {
        let configuration = URLSessionConfiguration.default
        configuration.httpAdditionalHeaders = HTTPHeaders.default.dictionary
        let manager = Alamofire.Session(configuration: URLSessionConfiguration.default)
        return manager
    }()

    private lazy var provider: MoyaProvider<MultiTarget> = {
        let endpointClosure = { (target: MultiTarget) -> Endpoint in
            return Endpoint.from(target: target, inEnvironment: self.environment)
        }
        let provider = MoyaProvider<MultiTarget>(endpointClosure: endpointClosure, session: session)
        return provider
    }()

    // MARK: - Initialization
    public init(environment: Environment) {
        self.environment = environment
    }

    // MARK: - RequestHandler
    public func handleRequest(response: Response?, error: Error?, completion: @escaping GenericCompletion<Void>) {
        handleRequest(response: response) { _ in
            self.handleRequest(error: error) { _ in
                completion(.success(()))
            }
        }
    }

    public func handleRequest(response: Response?, completion: @escaping GenericCompletion<Void>) {
        completion(.success(()))
    }

    public func handleRequest(error: Error?, completion: @escaping GenericCompletion<Void>) {
        completion(.success(()))
    }

    // MARK: - RequestAdapter
    public func adapt(_ urlRequest: URLRequest,
                      for session: Session,
                      completion: @escaping (Result<URLRequest, Error>) -> Void) {
        completion(.success(urlRequest))
    }

    // MARK: - RequestRetrier
    public func retry(_ request: Request,
                      for session: Session,
                      dueTo error: Error,
                      completion: @escaping (RetryResult) -> Void) {
        completion(.doNotRetry)
    }

    // MARK: - ErrorFilter
    public func getDefaultError() -> Error {
        return NSError(domain: "Atualize seu App :)", code: 900, userInfo: nil) as Error
    }

    public func filter(error: Error) -> Error {
        return error
    }

    public func filterForErrors(in result: MoyaDispatcherResult) -> MoyaResult {
        return result.result
    }

    public func filterForErrors(in response: MoyaDispatcherResponse) throws -> Response {
        return response.moyaResponse
    }

    // MARK: - Dispatcher
    public func call(endpoint: TargetType, completion: @escaping Completion) {
        provider.request(MultiTarget(endpoint)) { result in
            self.session.setSharedCookies(for: result.success?.response?.url)
            completion(result)
        }

    }
}
