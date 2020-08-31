//
//  DetailViewController.swift
//  Companies
//
//  Created by Daniel Gx on 21/08/20.
//  Copyright © 2020 Daniel Gx. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    
    // MARK: - Properties
    private lazy var presenter = DetailPresenter(with: self)
    private lazy var detailView = DetailView()
    var coordinator: DetailFlow?
    var enterprise: Companies?
    
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setLabels()
    }
    
    override func loadView() {
        view = detailView
    }
}


// MARK: - Presenter
extension DetailViewController: DetailViewPresenter {
    func setLabels() {
        detailView.enterpriseName.text = enterprise?.enterpriseName
        detailView.enterpriseDescription.text = enterprise?.description
    }
}
