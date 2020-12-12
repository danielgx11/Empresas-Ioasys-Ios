//
//  AuthenticationTests.swift
//  NetworkingTests
//
//  Created by Daniel Gomes on 12/12/20.
//

import XCTest
import Domain
@testable import Networking

class AuthenticationTests: XCTestCase {
    
    // MARK: - Properties
    
    private var expeactation: XCTestExpectation!
    private var dispatcher: CommonMoyaDispatcherMock!
    private var sut: AuthenticationRemoteDataSource!
    private var credentials: Credentials!

    override func setUp() {
        super.setUp()
        
        CommonMoyaDispatcherMock.isMockedEnvironment = true
        dispatcher = CommonMoyaDispatcherMock()
        sut = AuthenticationRemoteDataSource(dispacher: dispatcher)
        expeactation = XCTestExpectation()
        credentials = Credentials.generateFake()
    }

    override class func tearDown() {
        super.tearDown()
    }

    // MARK: - SignIn
    
    func testSimulateCreateSessionSuccess() {
        
        sut.authentication(credentials: credentials) { (result) in
            self.expeactation.fulfill()
            XCTAssertNotNil(result.success, "result.success shouldn't be nil")
        }
        wait(for: [expeactation], timeout: 5.0)
    }
    
    func testSimulateCreateSessionFailed() {
        
        dispatcher.isFailedTest = true
        sut.authentication(credentials: credentials) { (result) in
            self.expeactation.fulfill()
            XCTAssertNotNil(result.failure?.localizedDescription.isEmpty ?? true,
                            "error message during signIn shouldn't be empty")
        }
        wait(for: [expeactation], timeout: 5.0)
    }
    
    func testSimulateCreateSessionFailedWithInvalidData() {
        
        dispatcher.hasInvalidData = true
        sut.authentication(credentials: credentials) { (result) in
            self.expeactation.fulfill()
            XCTAssertNotNil(result.failure?.localizedDescription.isEmpty ?? true,
                            "error message during signIn shouldn't be empty")
        }
        wait(for: [expeactation], timeout: 5.0)
    }
    
    func testSimulateCreateSessionFailedWithReturnCode() {
        
        dispatcher.hasReturnCodeError = true
        sut.authentication(credentials: credentials) { (result) in
            self.expeactation.fulfill()
            XCTAssertNotNil(result.failure?.localizedDescription.isEmpty ?? true,
                            "error message during signIn shouldn't be empty")
        }
        wait(for: [expeactation], timeout: 5.0)
    }
}
