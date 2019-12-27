//
//  Empresas.swift
//  Empresas Ios
//
//  Created by Daniel G on 14/12/19.
//  Copyright © 2019 danielgomes. All rights reserved.
//

import Foundation
import UIKit

struct Empresas: Mappable {
    
    var enterprise_name: String = ""
    var photo: String? = ""
    var description: String? = ""
    var country: String? = ""
    var enterprise_type_name: String? = ""
    
    init(mapper: Mapper) {
        
        self.enterprise_name = mapper.keyPath("enterprise_name")
        self.photo = mapper.keyPath("photo")
        self.description = mapper.keyPath("description")
        self.country = mapper.keyPath("country")
        self.enterprise_type_name = mapper.keyPath("enterprise_type.enterprise_type_name")
    }
}
