//
//  DetailViewController.swift
//  Companies
//
//  Created by Daniel Gx on 21/08/20.
//  Copyright © 2020 Daniel Gx. All rights reserved.
//

import UIKit

protocol DetailPresenting { }

class DetailViewController: UIViewController {
    
    
    // MARK: - Properties
    private lazy var detailView = DetailView()
    private var presenter: DetailPresenting
    var enterprise: Companies?
    
    init(presenter: DetailPresenting) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
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
extension DetailViewController: DetailViewable {
    func setLabels() {
        detailView.enterpriseName.text = enterprise?.enterpriseName
        detailView.enterpriseDescription.text = enterprise?.description
    }
}
