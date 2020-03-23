//
//  CompanyViewPresenter.swift
//  Empresas Ios
//
//  Created by Daniel Gx on 23/03/20.
//  Copyright © 2020 danielgomes. All rights reserved.
//

import Foundation

// MARK: - Protocol

protocol CompanyPresenter: class {
    func setNavigationBar ()
    func setUpNavBar()
    func addNavBarImage()
}

class CompanyViewPresenter {
    
    // MARK: - Variables
    
    weak var view: CompanyPresenter?
    
    init(with view: CompanyPresenter) {
        self.view = view
    }
}
