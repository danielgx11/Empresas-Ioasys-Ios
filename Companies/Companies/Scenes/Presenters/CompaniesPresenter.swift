//
//  CompaniesPresenter.swift
//  Companies
//
//  Created by Daniel Gx on 19/08/20.
//  Copyright © 2020 Daniel Gx. All rights reserved.
//

import Foundation
import Moya

protocol CompaniesViewPresenter: class {
    func customizeNavigationController()
    func getCompanies(withTarget target: TargetType)
    func setupAnimation()
    func customizeTableView()
}

class CompaniesPresenter {
    
    
    // MARK: - Properties
    static var possible: Bool?
    private weak var view: CompaniesViewPresenter?
    
    
    init(with view: CompaniesViewPresenter) {
        self.view = view
    }
    
    
    // MARK: - Methods
    func isPossible() -> Bool {
        if CompaniesPresenter.possible == nil {
            return true
        }
        return false
    }
}
