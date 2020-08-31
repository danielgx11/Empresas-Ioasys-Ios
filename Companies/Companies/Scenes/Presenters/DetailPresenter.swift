//
//  DetailPresenter.swift
//  Companies
//
//  Created by Daniel Gx on 19/08/20.
//  Copyright © 2020 Daniel Gx. All rights reserved.
//

import Foundation

protocol DetailViewPresenter: class {
    func setLabels()
}

class DetailPresenter {
    
    
    // MARK: - Properties
    private weak var view: DetailViewPresenter?
    
    init(with view: DetailViewPresenter) {
        self.view = view
    }
}
