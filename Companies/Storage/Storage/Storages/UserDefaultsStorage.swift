//
//  UserDefaultsStorage.swift
//  Storage
//
//  Created by Daniel Gomes on 12/12/20.
//

import Foundation

public class UserDefaultsStorage: UserDefaultsStoring {

    public let userDefaults: UserDefaults

    public required init(suitName: String) {
        self.userDefaults = UserDefaults(suiteName: suitName) ?? .standard
    }

    public required init(userDefaults: UserDefaults) {
        self.userDefaults = userDefaults
    }

    public enum ValueKeyable: String, Keyable, CaseIterable {

        // AppConfigResponse
        case appConfig

        public var key: String {
            return rawValue
        }
    }
}
