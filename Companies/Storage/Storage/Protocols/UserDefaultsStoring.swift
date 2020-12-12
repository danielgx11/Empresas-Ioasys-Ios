//
//  UserDefaultsStoring.swift
//  Storage
//
//  Created by Daniel Gomes on 12/12/20.
//

import Foundation

public protocol UserDefaultsStoring {

    associatedtype ValueKeyable: Keyable, CaseIterable
    var userDefaults: UserDefaults { get }
    init(suitName: String)
    init(userDefaults: UserDefaults)

    func set(_ value: Any?, keyable: ValueKeyable, userId: String?)
    func removeItem(keyable: ValueKeyable, userId: String?)
    func removeAll(userId: String?)
    func get(keyable: ValueKeyable, userId: String?) -> Any?
    func get<T>(_ type: T.Type, keyable: ValueKeyable, userId: String?) -> T?
}

extension UserDefaultsStoring {

    internal func getKey(keyable: ValueKeyable, userId: String?) -> String {
        guard let userId = userId, !userId.isEmpty else {
            return keyable.key
        }
        return "\(userId)-\(keyable.key)"
    }

    public func set(_ value: Any?, keyable: ValueKeyable, userId: String? = nil) {
        let key = getKey(keyable: keyable, userId: userId)
        userDefaults.set(value, forKey: key)
    }

    public func removeItem(keyable: ValueKeyable, userId: String? = nil) {
        let key = getKey(keyable: keyable, userId: userId)
        userDefaults.removeObject(forKey: key)
    }

    public func removeAll(userId: String? = nil) {
        ValueKeyable.allCases.forEach { key in
            removeItem(keyable: key, userId: userId)
        }
    }

    public func get(keyable: ValueKeyable, userId: String? = nil) -> Any? {
        let key = getKey(keyable: keyable, userId: userId)
        return userDefaults.object(forKey: key)
    }

    public func get<T>(_ type: T.Type, keyable: ValueKeyable, userId: String? = nil) -> T? {
        let key = getKey(keyable: keyable, userId: userId)
        return userDefaults.object(forKey: key) as? T
    }
}
