//
//  InteractionError.swift
//  Domain
//
//  Created by Daniel Gomes on 12/12/20.
//

import Foundation

public enum InteractionError: Error {

    case internalError(String)
    case unknownError
    case none
}

extension InteractionError: LocalizedError {

    public var errorDescription: String? {
        switch self {
        case .internalError(let message):
            return message
        case .unknownError:
            return "Erro desconhecido. Por favor tente novamente."
        default:
            return ""
        }
    }
}
