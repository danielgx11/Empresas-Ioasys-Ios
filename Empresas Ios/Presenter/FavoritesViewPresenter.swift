//
//  FavoritesViewPresenter.swift
//  Empresas Ios
//
//  Created by Daniel Gx on 15/04/20.
//  Copyright © 2020 danielgomes. All rights reserved.
//

import Foundation

protocol FavoritesPresenter: class {
    func customizeNavigationController()
}

class FavoritesViewPresenter {
    
    // MARK: - Properties
    
    weak var view: FavoritesPresenter?
    private let favoritesTableView = FavoritesTableView()
    
    init(with view: FavoritesPresenter) {
        self.view = view
    }
}
