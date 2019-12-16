//
//  Empresas.swift
//  Empresas Ios
//
//  Created by Daniel G on 14/12/19.
//  Copyright © 2019 danielgomes. All rights reserved.
//

import Foundation

struct EnterpriseTypes: Mappable {
    var id: Int
    var enterpriseTypeName: String
    
    init(mapper: Mapper) {
        self.id = mapper.keyPath("id")
        self.enterpriseTypeName = mapper.keyPath("enterprise_type_name")
    }
}

struct Empresas: Mappable {
    
    var id: Int?
    var emailEnterprise: String?
    var facebook: String?
    var twitter: String?
    var linkedin: String?
    var phone: String?
    var ownEnterprise: Bool?
    var enterpriseName: String?
    var photo: String?
    var description: String?
    var city: String?
    var country: String?
    var value: Int?
    var sharePrice: Double?
    var enterpriseType: [EnterpriseTypes]?
    
    init(mapper: Mapper) {
        self.id = mapper.keyPath("id")
        self.emailEnterprise = mapper.keyPath("email_enterprise")
        self.facebook = mapper.keyPath("facebook")
        self.twitter = mapper.keyPath("twitter")
        self.linkedin = mapper.keyPath("linkedin")
        self.phone = mapper.keyPath("phone")
        self.ownEnterprise = mapper.keyPath("own_enterprise")
        self.enterpriseName = mapper.keyPath("enterprise_name")
        self.photo = mapper.keyPath("photo")
        self.description = mapper.keyPath("description")
        self.city = mapper.keyPath("city")
        self.country = mapper.keyPath("country")
        self.value = mapper.keyPath("value")
        self.sharePrice = mapper.keyPath("share_price")
        self.enterpriseType = mapper.keyPath("enterprise_type")
    }
}
