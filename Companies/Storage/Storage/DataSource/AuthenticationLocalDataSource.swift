//
//  AuthenticationLocalDataSource.swift
//  Storage
//
//  Created by Daniel Gomes on 12/12/20.
//

import Domain
import AppData
import Commons

public class AuthenticationLocalDataSource {

    public let userDefaults: UserDefaultsStorage
    public let keychain: KeychainStorage

    public init(userDefaults: UserDefaultsStorage, keychain: KeychainStorage) {
        self.userDefaults = userDefaults
        self.keychain = keychain
    }
}

extension AuthenticationLocalDataSource: AppData.AuthenticationLocalDataSourceProtocol {

    public func save(response: AuthenticationResponse) throws {
        let data = try SetupConstants.encoder.encode(response)
        try keychain.set(data, keyable: .authentication)
    }
    
    public func save(credentials: Credentials) throws {
        let data = try SetupConstants.encoder.encode(credentials)
        try keychain.set(data, keyable: .credentials)
    }
    
    public func getCredentials() throws -> Credentials {
        do {
            let data = try keychain.getData(keyable: .credentials).defaultValue
            let credentials = try SetupConstants.decoder.decode(Credentials.self, from: data)
            return credentials
        } catch let error {
            throw error
        }
    }
}
