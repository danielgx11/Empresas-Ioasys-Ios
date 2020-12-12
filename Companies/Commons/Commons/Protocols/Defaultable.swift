//
//  Defaultable.swift
//  Commons
//
//  Created by Daniel Gomes on 12/12/20.
//  Copyright © 2020 Daniel Gomes. All rights reserved.
//

import Foundation

public protocol Defaultable {
    
    static var defaultValue: Self { get }
}

public extension Optional where Wrapped: Defaultable {
    
    var defaultValue: Wrapped { return self ?? Wrapped.defaultValue}
}

// MARK: - Defaultable Conformances

extension String: Defaultable {
    
    public static var defaultValue: String { "" }
}

extension Data: Defaultable {
    
    public static var defaultValue: Data { Data() }
}

extension Double: Defaultable {
    
    public static var defaultValue: Double { 0.0 }
}

extension Int: Defaultable {

    public static var defaultValue: Int {
        return 0
    }
}

extension Dictionary: Defaultable {

    public static var defaultValue: Dictionary<Key, Value> {
        return [:]
    }
}

extension Array: Defaultable {

    public static var defaultValue: Array {
        return []
    }
}

extension Bool: Defaultable {

    public static var defaultValue: Bool {
        return false
    }
}
