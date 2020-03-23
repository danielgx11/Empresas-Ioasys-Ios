//
//  ListCompaniesViewPresenter.swift
//  Empresas Ios
//
//  Created by Daniel Gx on 23/03/20.
//  Copyright © 2020 danielgomes. All rights reserved.
//

import Foundation

protocol ListCompanyPresenter: class {
    func setTableView()
    func setUpNavBar()
    func setUpSeachBar()
    func hideSearchBar()
    func addNavBarImage()
}

class ListCompaniesViewPresenter {
    
    // MARK: - Variables
    
    weak var view: ListCompanyPresenter?
    
    init(with view: ListCompanyPresenter) {
        self.view = view
    }
    
    
}
