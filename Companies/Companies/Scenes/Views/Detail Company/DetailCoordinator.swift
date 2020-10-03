//
//  DetailCoordinator.swift
//  Companies
//
//  Created by Daniel Gx on 28/05/20.
//  Copyright © 2020 Daniel Gx. All rights reserved.
//

import UIKit

protocol DetailCoordinatorDelegate: AnyObject { }

class DetailCoordinator: Coordinator {
    
    
    // MARK: - Properties
    private let detailFactory: DetailFactory
    let navigationController: UINavigationController
    
    init(navigationController: UINavigationController, detailFactory: DetailFactory) {
        self.navigationController = navigationController
        self.detailFactory = detailFactory
    }
    
    var selectedCompany: Companies?
    
    func start() {
        let detailViewController = detailFactory.makeDetailViewController()
        detailViewController.enterprise = selectedCompany
        navigationController.present(detailViewController, animated: true)
    }
}


// MARK: - SceneCoordinating
extension DetailCoordinator: DetailSceneCoordinating { }
