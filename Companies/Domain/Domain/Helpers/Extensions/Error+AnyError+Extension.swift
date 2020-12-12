//
//  Error+AnyError+Extension.swift
//  Domain
//
//  Created by Daniel Gomes on 03/11/20.
//

import Foundation

public extension Error {

    var asAnyError: AnyError {
        return AnyError(self)
    }
}

public struct AnyError: Swift.Error {

    public let error: Swift.Error

    public init(_ error: Swift.Error) {
        if let anyError = error as? AnyError {
            self = anyError
        } else {
            self.error = error
        }
    }
}

extension AnyError: CustomStringConvertible {
    public var description: String {
        return String(describing: error)
    }
}

extension AnyError: LocalizedError {
    public var errorDescription: String? {
        return error.localizedDescription
    }

    public var failureReason: String? {
        return (error as? LocalizedError)?.failureReason
    }

    public var helpAnchor: String? {
        return (error as? LocalizedError)?.helpAnchor
    }

    public var recoverySuggestion: String? {
        return (error as? LocalizedError)?.recoverySuggestion
    }
}