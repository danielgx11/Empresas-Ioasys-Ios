//
//  ProfileViewPresenter.swift
//  Empresas Ios
//
//  Created by Daniel Gx on 15/04/20.
//  Copyright © 2020 danielgomes. All rights reserved.
//

import Foundation

protocol ProfilePresenter: class {
    func alertController(_ title: String)
    func customizeNavigationController()
    func setUser()
}

class ProfileViewPresenter {
    
    // MARK: - Properties
    
    weak var view: ProfilePresenter?
    private let profileTableView = ProfileTableView()
    
    init(with view: ProfilePresenter) {
        self.view = view
    }
    
    // MARK: - Methods
    
}
