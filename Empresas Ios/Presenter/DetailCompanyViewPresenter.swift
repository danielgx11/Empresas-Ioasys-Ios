//
//  DetailCompanyViewPresenter.swift
//  Empresas Ios
//
//  Created by Daniel Gx on 23/03/20.
//  Copyright © 2020 danielgomes. All rights reserved.
//

import Foundation

protocol DetailCompanyPresenter: class {
    func setNavigationController()
    func setOutlets() throws
}

class DetailCompanyViewPresenter {
    
    // MARK: - Variables
    
    weak var view: DetailCompanyPresenter?
    
    init(with view: DetailCompanyPresenter) {
        self.view = view
    }
}
