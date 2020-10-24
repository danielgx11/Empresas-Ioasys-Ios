//
//  Companies.swift
//  Companies
//
//  Created by Daniel Gx on 18/05/20.
//  Copyright © 2020 Daniel Gx. All rights reserved.
//

import Foundation

struct Enterprises: Codable {
    var enterprises: [Companies]?
}

struct EnterpriseType: Codable {
    var id: Int?
    var enterpriseTypeName: String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case enterpriseTypeName = "enterprise_type_name"
    }
}

struct Companies: Codable {
    var id: Int?
    var enterpriseName: String?
    var description: String?
    var city: String?
    var country: String?
    var enterpriseType: EnterpriseType?
    
    enum CodingKeys: String, CodingKey {
        case id, description, city, country
        case enterpriseName = "enterprise_name"
        case enterpriseType = "enterprise_type"
    }
}
