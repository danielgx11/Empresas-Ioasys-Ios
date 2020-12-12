//
//  Response+Extension.swift
//  Networking
//
//  Created by Daniel Gomes on 12/12/20.
//

import Moya

extension Response {

    func response(encoding: String.Encoding) throws -> Response {
        guard let string = String(data: data, encoding: encoding), let utf8Data = string.data(using: .utf8) else {
            throw MoyaError.stringMapping(self)
        }
        return Response(statusCode: statusCode, data: utf8Data, request: request, response: response)
    }

    func returnCode() throws -> Int {
        try self.map(Int.self, atKeyPath: "codigoDeRetorno")
    }
}
