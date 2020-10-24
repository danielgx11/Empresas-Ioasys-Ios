//
//  DetailPresenter.swift
//  Companies
//
//  Created by Daniel Gx on 19/08/20.
//  Copyright © 2020 Daniel Gx. All rights reserved.
//

import Foundation

public protocol DetailViewable: AnyObject {
    func setLabels()
}

public protocol DetailSceneCoordinating { }

public protocol DetailPresentable {
    var view: DetailViewable? { get }
    var coordinator: DetailSceneCoordinating? { get }
}


class DetailPresenter: DetailPresentable {
    
    
    // MARK: - Properties
    internal weak var view: DetailViewable?
    internal var coordinator: DetailSceneCoordinating?
    
    required public init(withCoordinator coordinator: DetailSceneCoordinating) {
        self.coordinator = coordinator
    }
    
    func attatch(_ view: DetailViewable) {
        self.view = view
    }
}


extension DetailPresenter: DetailPresenting { }
