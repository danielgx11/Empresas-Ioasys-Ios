//
//  DetailCoordinator.swift
//  Companies
//
//  Created by Daniel Gx on 28/05/20.
//  Copyright © 2020 Daniel Gx. All rights reserved.
//

import UIKit


class DetailCoordinator: Coordinator {
    
    
    // MARK: - Properties
    let navigationController: UINavigationController
    var selectedCompany: Companies
    
    init(navigationController: UINavigationController, selectedCompany: Companies) {
        self.navigationController = navigationController
        self.selectedCompany = selectedCompany
    }
    
    func start() {
        let detailPresenter = DetailPresenter(withCoordinator: self)
        let detailViewController = DetailViewController(presenter: detailPresenter)
        detailPresenter.attatch(detailViewController)
        detailViewController.enterprise = selectedCompany
        navigationController.present(detailViewController, animated: true)
    }
}


// MARK: - SceneCoordinating
extension DetailCoordinator: DetailSceneCoordinating { }
