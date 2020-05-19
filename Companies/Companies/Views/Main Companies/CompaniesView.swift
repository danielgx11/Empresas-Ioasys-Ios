//
//  CompaniesView.swift
//  Companies
//
//  Created by Daniel Gx on 19/05/20.
//  Copyright © 2020 Daniel Gx. All rights reserved.
//

import UIKit

class CompaniesView: UIViewController, StoryboardInitialize {
    
    // MARK: - Properties
    
    var coordinator: CompaniesFlow?
    lazy var searchBar: UISearchBar = UISearchBar()
    
    // MARK: - Actions
    
    @objc func searchTapped() {
        setupSearchBar()
    }
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        customizeNavigationController()
    }
    
    // MARK: - Methods
    
    func customizeNavigationController() {
        navigationController?.isNavigationBarHidden = false
        navigationItem.hidesBackButton = true
        navigationItem.titleView = UIImageView(image: UIImage(named: "logoIcon"))
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .search, target: self, action: #selector(searchTapped))
        navigationController?.navigationBar.barTintColor = UIColor(red: 255/255, green: 0/255, blue: 128/255, alpha: 1.0)
        navigationController?.navigationBar.tintColor = .white
    }
    

}

// MARK: - Search Controller

extension CompaniesView: UISearchBarDelegate {
    
    func setupSearchBar() {
        searchBar.searchBarStyle = .prominent
        searchBar.placeholder = "Search Companies"
        searchBar.sizeToFit()
        searchBar.isTranslucent = false
        searchBar.delegate = self
        searchBar.searchTextField.backgroundColor = .white
        navigationItem.titleView = searchBar
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        //
    }
}
